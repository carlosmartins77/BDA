Select DISTINCT TOP 10 * FROM ElementosEquipa el, JogoFutebol jf
WHERE el.IdEquipaFK = jf.IdEquipa1FK OR el.IdEquipaFK = jf.IdEquipa2FK



SELECT * FROM JogoFutebol jf
WHERE jf.IdEquipa1FK IN ( SELECT eq.IdEquipa IdEquipa FROM Equipa eq, ElementosEquipa el
WHERE eq.IdEquipa = el.IdEquipaFK ) AND jf.Status = 'Finished' AND jf.IDEquipaVencedora IS NOT NULL
OR jf.IdEquipa2FK IN ( SELECT eq.IdEquipa IdEquipa FROM Equipa eq, ElementosEquipa el
WHERE eq.IdEquipa = el.IdEquipaFK ) AND jf.Status = 'Finished' AND jf.IDEquipaVencedora IS NOT NULL



SELECT eq.IdEquipa IdEquipa FROM Equipa eq, ElementosEquipa el
WHERE eq.IdEquipa = el.IdEquipaFK AND el.IdUtilizadorFK = '58376'