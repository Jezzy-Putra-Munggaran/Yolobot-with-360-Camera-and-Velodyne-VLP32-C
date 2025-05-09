# huskybot_mapping

[![Build Status](https://github.com/yourusername/huskybot/actions/workflows/ci.yml/badge.svg)](https://github.com/yourusername/huskybot/actions)

Integrasi SLAM 3D (Cartographer ROS2) untuk mapping berbasis point cloud Velodyne VLP-32C.

---

## Fitur
- Launch file Cartographer ROS2.
- Konfigurasi mapping 3D (`velodyne_3d.lua`).
- Remap topic `/velodyne_points` ke `/points2`.

---

## Struktur Folder
- `launch/` : Launch file mapping.
- `config/` : File konfigurasi Cartographer.

---

## Cara Pakai

**Jalankan mapping:**
```sh
ros2 launch huskybot_mapping mapping.launch.py
```

**Parameter penting di config:**
- `min_range`, `max_range`: Jarak minimum/maksimum LiDAR.
- `tracking_frame`: Frame utama robot (`base_link`).
- `num_point_clouds`: Jumlah input point cloud (1 untuk Velodyne).

---

## Contoh Command Visualisasi
```sh
rviz2 -d huskybot_mapping/rviz/mapping.rviz
```

---

## Saran CI
- Tambahkan test launch file mapping.
- Gunakan [pytest](https://docs.pytest.org/en/stable/) untuk test Python.

---

## Catatan
Pastikan topic point cloud dan frame konsisten dengan URDF dan node lain.

## Diagram Pipeline Mapping

```
[Velodyne PointCloud] --> [Cartographer Node] --> /map
```

## Contoh Dataset Map

- Map hasil SLAM: `map_20250423.pcd` (bisa disimpan dengan service Cartographer)

## Penjelasan Parameter Config

```lua
TRAJECTORY_BUILDER_3D.min_range = 1.0
TRAJECTORY_BUILDER_3D.max_range = 100.0
tracking_frame = "base_link"
```

## Troubleshooting

- Jika map tidak bertambah, cek topic point cloud dan frame.
- Jika map "melayang", cek IMU dan parameter SLAM.