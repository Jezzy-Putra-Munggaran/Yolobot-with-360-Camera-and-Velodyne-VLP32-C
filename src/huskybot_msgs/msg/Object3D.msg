std_msgs/Header header         # Header ROS2 (timestamp dan frame_id, untuk sinkronisasi waktu dan referensi frame)
string label                  # Nama kelas objek hasil fusion (misal: "person", "car", dsb)
float32[3] center             # [x, y, z] Titik tengah bounding box 3D dalam meter (koordinat dunia/robot)
float32[3] size               # [dx, dy, dz] Ukuran bounding box 3D dalam meter (panjang, lebar, tinggi)
float32[4] orientation        # Quaternion [x, y, z, w] orientasi bounding box (default axis-aligned jika [0,0,0,1])
float32 confidence            # Skor confidence hasil fusion (0.0 - 1.0)