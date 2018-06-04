L'ensemble 1 appartient-il à l'ensemble 2

($RefArray | ? { $Array -Contains $_ }).Count -eq $RefArray.Count
