#!/bin/bash
N="${1:-20}"
echo "Lanzando $N inserciones simultáneas en la BD..."

for i in $(seq 1 $N); do
  podman exec planka-db psql -U planka -c \
    "INSERT INTO card (board_id, list_id, creator_user_id, type, position, name, comments_total, is_closed) VALUES (1804321791561171973, 1804323686228952073, 1804317547739218945, 'project', $((i*65536)), 'Tarjeta-carga-$i', 0, false);" \
    > /dev/null &
done

wait
echo "¡Listo! $N tarjetas insertadas."
