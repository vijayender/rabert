(load "~/work/elisp/rabert/switch.el")

(defun run-test-2 ()
  (setq sw2 (make-switch))
  (switch-input-receiver sw-2-in sw2)
  (setf (switch-hostname sw2) "^F340")
  (sw-open sw2 "f340-26-15-comm" "2057" 'sw-2-in)
  (switch-to-buffer-other-window (switch-buffer sw2))
  (sw-exec sw2)
  (sit-for 10)
  (sw-config-multiple sw2 (split-string
			   "
en
conf t
interface gi0/0.1
encapsulation dot1Q 1
ip address 10.0.1.254 255.255.255.0
interface gi0/0.2
encapsulation dot1Q 2
ip address 10.0.2.254 255.255.255.0
interface gi0/0.3
encapsulation dot1Q 3
ip address 10.0.3.254 255.255.255.0
interface gi0/0.4
encapsulation dot1Q 4
ip address 10.0.4.254 255.255.255.0
interface gi0/0.5
encapsulation dot1Q 5
ip address 10.0.5.254 255.255.255.0
interface gi0/0.6
encapsulation dot1Q 6
ip address 10.0.6.254 255.255.255.0
interface gi0/0.7
encapsulation dot1Q 7
ip address 10.0.7.254 255.255.255.0
interface gi0/0.8
encapsulation dot1Q 8
ip address 10.0.8.254 255.255.255.0
interface gi0/0.9
encapsulation dot1Q 9
ip address 10.0.9.254 255.255.255.0
interface gi0/0.10
encapsulation dot1Q 10
ip address 10.0.10.254 255.255.255.0
interface gi0/0.11
encapsulation dot1Q 11
ip address 10.0.11.254 255.255.255.0
interface gi0/0.12
encapsulation dot1Q 12
ip address 10.0.12.254 255.255.255.0
interface gi0/0.13
encapsulation dot1Q 13
ip address 10.0.13.254 255.255.255.0
interface gi0/0.14
encapsulation dot1Q 14
ip address 10.0.14.254 255.255.255.0
interface gi0/0.15
encapsulation dot1Q 15
ip address 10.0.15.254 255.255.255.0
interface gi0/0.16
encapsulation dot1Q 16
ip address 10.0.16.254 255.255.255.0
interface gi0/0.17
encapsulation dot1Q 17
ip address 10.0.17.254 255.255.255.0
interface gi0/0.18
encapsulation dot1Q 18
ip address 10.0.18.254 255.255.255.0
interface gi0/0.19
encapsulation dot1Q 19
ip address 10.0.19.254 255.255.255.0
interface gi0/0.20
encapsulation dot1Q 20
ip address 10.0.20.254 255.255.255.0
interface gi0/0.21
encapsulation dot1Q 21
ip address 10.0.21.254 255.255.255.0
interface gi0/0.22
encapsulation dot1Q 22
ip address 10.0.22.254 255.255.255.0
interface gi0/0.23
encapsulation dot1Q 23
ip address 10.0.23.254 255.255.255.0
interface gi0/0.24
encapsulation dot1Q 24
ip address 10.0.24.254 255.255.255.0
interface gi0/0.25
encapsulation dot1Q 25
ip address 10.0.25.254 255.255.255.0
interface gi0/0.26
encapsulation dot1Q 26
ip address 10.0.26.254 255.255.255.0
interface gi0/0.27
encapsulation dot1Q 27
ip address 10.0.27.254 255.255.255.0
interface gi0/0.28
encapsulation dot1Q 28
ip address 10.0.28.254 255.255.255.0
interface gi0/0.29
encapsulation dot1Q 29
ip address 10.0.29.254 255.255.255.0
interface gi0/0.30
encapsulation dot1Q 30
ip address 10.0.30.254 255.255.255.0
interface gi0/0.31
encapsulation dot1Q 31
ip address 10.0.31.254 255.255.255.0
interface gi0/0.32
encapsulation dot1Q 32
ip address 10.0.32.254 255.255.255.0
interface gi0/0.33
encapsulation dot1Q 33
ip address 10.0.33.254 255.255.255.0
interface gi0/0.34
encapsulation dot1Q 34
ip address 10.0.34.254 255.255.255.0
interface gi0/0.35
encapsulation dot1Q 35
ip address 10.0.35.254 255.255.255.0
interface gi0/0.36
encapsulation dot1Q 36
ip address 10.0.36.254 255.255.255.0
interface gi0/0.37
encapsulation dot1Q 37
ip address 10.0.37.254 255.255.255.0
interface gi0/0.38
encapsulation dot1Q 38
ip address 10.0.38.254 255.255.255.0
interface gi0/0.39
encapsulation dot1Q 39
ip address 10.0.39.254 255.255.255.0
interface gi0/0.40
encapsulation dot1Q 40
ip address 10.0.40.254 255.255.255.0
interface gi0/0.41
encapsulation dot1Q 41
ip address 10.0.41.254 255.255.255.0
interface gi0/0.42
encapsulation dot1Q 42
ip address 10.0.42.254 255.255.255.0
interface gi0/0.43
encapsulation dot1Q 43
ip address 10.0.43.254 255.255.255.0
interface gi0/0.44
encapsulation dot1Q 44
ip address 10.0.44.254 255.255.255.0
interface gi0/0.45
encapsulation dot1Q 45
ip address 10.0.45.254 255.255.255.0
interface gi0/0.46
encapsulation dot1Q 46
ip address 10.0.46.254 255.255.255.0
interface gi0/0.47
encapsulation dot1Q 47
ip address 10.0.47.254 255.255.255.0
interface gi0/0.48
encapsulation dot1Q 48
ip address 10.0.48.254 255.255.255.0
interface gi0/0.49
encapsulation dot1Q 49
ip address 10.0.49.254 255.255.255.0
interface gi0/0.50
encapsulation dot1Q 50
ip address 10.0.50.254 255.255.255.0
interface gi0/0.51
encapsulation dot1Q 51
ip address 10.0.51.254 255.255.255.0
interface gi0/0.52
encapsulation dot1Q 52
ip address 10.0.52.254 255.255.255.0
interface gi0/0.53
encapsulation dot1Q 53
ip address 10.0.53.254 255.255.255.0
interface gi0/0.54
encapsulation dot1Q 54
ip address 10.0.54.254 255.255.255.0
interface gi0/0.55
encapsulation dot1Q 55
ip address 10.0.55.254 255.255.255.0
interface gi0/0.56
encapsulation dot1Q 56
ip address 10.0.56.254 255.255.255.0
interface gi0/0.57
encapsulation dot1Q 57
ip address 10.0.57.254 255.255.255.0
interface gi0/0.58
encapsulation dot1Q 58
ip address 10.0.58.254 255.255.255.0
interface gi0/0.59
encapsulation dot1Q 59
ip address 10.0.59.254 255.255.255.0
interface gi0/0.60
encapsulation dot1Q 60
ip address 10.0.60.254 255.255.255.0
interface gi0/0.61
encapsulation dot1Q 61
ip address 10.0.61.254 255.255.255.0
interface gi0/0.62
encapsulation dot1Q 62
ip address 10.0.62.254 255.255.255.0
interface gi0/0.63
encapsulation dot1Q 63
ip address 10.0.63.254 255.255.255.0
interface gi0/0.64
encapsulation dot1Q 64
ip address 10.0.64.254 255.255.255.0
interface gi0/0.65
encapsulation dot1Q 65
ip address 10.0.65.254 255.255.255.0
interface gi0/0.66
encapsulation dot1Q 66
ip address 10.0.66.254 255.255.255.0
interface gi0/0.67
encapsulation dot1Q 67
ip address 10.0.67.254 255.255.255.0
interface gi0/0.68
encapsulation dot1Q 68
ip address 10.0.68.254 255.255.255.0
interface gi0/0.69
encapsulation dot1Q 69
ip address 10.0.69.254 255.255.255.0
interface gi0/0.70
encapsulation dot1Q 70
ip address 10.0.70.254 255.255.255.0
interface gi0/0.71
encapsulation dot1Q 71
ip address 10.0.71.254 255.255.255.0
interface gi0/0.72
encapsulation dot1Q 72
ip address 10.0.72.254 255.255.255.0
interface gi0/0.73
encapsulation dot1Q 73
ip address 10.0.73.254 255.255.255.0
interface gi0/0.74
encapsulation dot1Q 74
ip address 10.0.74.254 255.255.255.0
interface gi0/0.75
encapsulation dot1Q 75
ip address 10.0.75.254 255.255.255.0
interface gi0/0.76
encapsulation dot1Q 76
ip address 10.0.76.254 255.255.255.0
interface gi0/0.77
encapsulation dot1Q 77
ip address 10.0.77.254 255.255.255.0
interface gi0/0.78
encapsulation dot1Q 78
ip address 10.0.78.254 255.255.255.0
interface gi0/0.79
encapsulation dot1Q 79
ip address 10.0.79.254 255.255.255.0
interface gi0/0.80
encapsulation dot1Q 80
ip address 10.0.80.254 255.255.255.0
interface gi0/0.81
encapsulation dot1Q 81
ip address 10.0.81.254 255.255.255.0
interface gi0/0.82
encapsulation dot1Q 82
ip address 10.0.82.254 255.255.255.0
interface gi0/0.83
encapsulation dot1Q 83
ip address 10.0.83.254 255.255.255.0
interface gi0/0.84
encapsulation dot1Q 84
ip address 10.0.84.254 255.255.255.0
interface gi0/0.85
encapsulation dot1Q 85
ip address 10.0.85.254 255.255.255.0
interface gi0/0.86
encapsulation dot1Q 86
ip address 10.0.86.254 255.255.255.0
interface gi0/0.87
encapsulation dot1Q 87
ip address 10.0.87.254 255.255.255.0
interface gi0/0.88
encapsulation dot1Q 88
ip address 10.0.88.254 255.255.255.0
interface gi0/0.89
encapsulation dot1Q 89
ip address 10.0.89.254 255.255.255.0
interface gi0/0.90
encapsulation dot1Q 90
ip address 10.0.90.254 255.255.255.0
interface gi0/0.91
encapsulation dot1Q 91
ip address 10.0.91.254 255.255.255.0
interface gi0/0.92
encapsulation dot1Q 92
ip address 10.0.92.254 255.255.255.0
interface gi0/0.93
encapsulation dot1Q 93
ip address 10.0.93.254 255.255.255.0
interface gi0/0.94
encapsulation dot1Q 94
ip address 10.0.94.254 255.255.255.0
interface gi0/0.95
encapsulation dot1Q 95
ip address 10.0.95.254 255.255.255.0
interface gi0/0.96
encapsulation dot1Q 96
ip address 10.0.96.254 255.255.255.0
interface gi0/0.97
encapsulation dot1Q 97
ip address 10.0.97.254 255.255.255.0
interface gi0/0.98
encapsulation dot1Q 98
ip address 10.0.98.254 255.255.255.0
interface gi0/0.99
encapsulation dot1Q 99
ip address 10.0.99.254 255.255.255.0
interface gi0/0.100
encapsulation dot1Q 100
ip address 10.0.100.254 255.255.255.0
interface gi0/0.101
encapsulation dot1Q 101
ip address 10.0.101.254 255.255.255.0
interface gi0/0.102
encapsulation dot1Q 102
ip address 10.0.102.254 255.255.255.0
interface gi0/0.103
encapsulation dot1Q 103
ip address 10.0.103.254 255.255.255.0
interface gi0/0.104
encapsulation dot1Q 104
ip address 10.0.104.254 255.255.255.0
interface gi0/0.105
encapsulation dot1Q 105
ip address 10.0.105.254 255.255.255.0
interface gi0/0.106
encapsulation dot1Q 106
ip address 10.0.106.254 255.255.255.0
interface gi0/0.107
encapsulation dot1Q 107
ip address 10.0.107.254 255.255.255.0
interface gi0/0.108
encapsulation dot1Q 108
ip address 10.0.108.254 255.255.255.0
interface gi0/0.109
encapsulation dot1Q 109
ip address 10.0.109.254 255.255.255.0
interface gi0/0.110
encapsulation dot1Q 110
ip address 10.0.110.254 255.255.255.0
interface gi0/0.111
encapsulation dot1Q 111
ip address 10.0.111.254 255.255.255.0
interface gi0/0.112
encapsulation dot1Q 112
ip address 10.0.112.254 255.255.255.0
interface gi0/0.113
encapsulation dot1Q 113
ip address 10.0.113.254 255.255.255.0
interface gi0/0.114
encapsulation dot1Q 114
ip address 10.0.114.254 255.255.255.0
interface gi0/0.115
encapsulation dot1Q 115
ip address 10.0.115.254 255.255.255.0
interface gi0/0.116
encapsulation dot1Q 116
ip address 10.0.116.254 255.255.255.0
interface gi0/0.117
encapsulation dot1Q 117
ip address 10.0.117.254 255.255.255.0
interface gi0/0.118
encapsulation dot1Q 118
ip address 10.0.118.254 255.255.255.0
interface gi0/0.119
encapsulation dot1Q 119
ip address 10.0.119.254 255.255.255.0
interface gi0/0.120
encapsulation dot1Q 120
ip address 10.0.120.254 255.255.255.0
interface gi0/0.121
encapsulation dot1Q 121
ip address 10.0.121.254 255.255.255.0
interface gi0/0.122
encapsulation dot1Q 122
ip address 10.0.122.254 255.255.255.0
interface gi0/0.123
encapsulation dot1Q 123
ip address 10.0.123.254 255.255.255.0
interface gi0/0.124
encapsulation dot1Q 124
ip address 10.0.124.254 255.255.255.0
interface gi0/0.125
encapsulation dot1Q 125
ip address 10.0.125.254 255.255.255.0
interface gi0/0.126
encapsulation dot1Q 126
ip address 10.0.126.254 255.255.255.0
interface gi0/0.127
encapsulation dot1Q 127
ip address 10.0.127.254 255.255.255.0
interface gi0/0.128
encapsulation dot1Q 128
ip address 10.0.128.254 255.255.255.0
interface gi0/0.129
encapsulation dot1Q 129
ip address 10.0.129.254 255.255.255.0
interface gi0/0.130
encapsulation dot1Q 130
ip address 10.0.130.254 255.255.255.0
interface gi0/0.131
encapsulation dot1Q 131
ip address 10.0.131.254 255.255.255.0
interface gi0/0.132
encapsulation dot1Q 132
ip address 10.0.132.254 255.255.255.0
interface gi0/0.133
encapsulation dot1Q 133
ip address 10.0.133.254 255.255.255.0
interface gi0/0.134
encapsulation dot1Q 134
ip address 10.0.134.254 255.255.255.0
interface gi0/0.135
encapsulation dot1Q 135
ip address 10.0.135.254 255.255.255.0
interface gi0/0.136
encapsulation dot1Q 136
ip address 10.0.136.254 255.255.255.0
interface gi0/0.137
encapsulation dot1Q 137
ip address 10.0.137.254 255.255.255.0
interface gi0/0.138
encapsulation dot1Q 138
ip address 10.0.138.254 255.255.255.0
interface gi0/0.139
encapsulation dot1Q 139
ip address 10.0.139.254 255.255.255.0
interface gi0/0.140
encapsulation dot1Q 140
ip address 10.0.140.254 255.255.255.0
interface gi0/0.141
encapsulation dot1Q 141
ip address 10.0.141.254 255.255.255.0
interface gi0/0.142
encapsulation dot1Q 142
ip address 10.0.142.254 255.255.255.0
interface gi0/0.143
encapsulation dot1Q 143
ip address 10.0.143.254 255.255.255.0
interface gi0/0.144
encapsulation dot1Q 144
ip address 10.0.144.254 255.255.255.0
interface gi0/0.145
encapsulation dot1Q 145
ip address 10.0.145.254 255.255.255.0
interface gi0/0.146
encapsulation dot1Q 146
ip address 10.0.146.254 255.255.255.0
interface gi0/0.147
encapsulation dot1Q 147
ip address 10.0.147.254 255.255.255.0
interface gi0/0.148
encapsulation dot1Q 148
ip address 10.0.148.254 255.255.255.0
interface gi0/0.149
encapsulation dot1Q 149
ip address 10.0.149.254 255.255.255.0
interface gi0/0.150
encapsulation dot1Q 150
ip address 10.0.150.254 255.255.255.0
interface gi0/0.151
encapsulation dot1Q 151
ip address 10.0.151.254 255.255.255.0
interface gi0/0.152
encapsulation dot1Q 152
ip address 10.0.152.254 255.255.255.0
interface gi0/0.153
encapsulation dot1Q 153
ip address 10.0.153.254 255.255.255.0
interface gi0/0.154
encapsulation dot1Q 154
ip address 10.0.154.254 255.255.255.0
interface gi0/0.155
encapsulation dot1Q 155
ip address 10.0.155.254 255.255.255.0
interface gi0/0.156
encapsulation dot1Q 156
ip address 10.0.156.254 255.255.255.0
interface gi0/0.157
encapsulation dot1Q 157
ip address 10.0.157.254 255.255.255.0
interface gi0/0.158
encapsulation dot1Q 158
ip address 10.0.158.254 255.255.255.0
interface gi0/0.159
encapsulation dot1Q 159
ip address 10.0.159.254 255.255.255.0
interface gi0/0.160
encapsulation dot1Q 160
ip address 10.0.160.254 255.255.255.0
interface gi0/0.161
encapsulation dot1Q 161
ip address 10.0.161.254 255.255.255.0
interface gi0/0.162
encapsulation dot1Q 162
ip address 10.0.162.254 255.255.255.0
interface gi0/0.163
encapsulation dot1Q 163
ip address 10.0.163.254 255.255.255.0
interface gi0/0.164
encapsulation dot1Q 164
ip address 10.0.164.254 255.255.255.0
interface gi0/0.165
encapsulation dot1Q 165
ip address 10.0.165.254 255.255.255.0
interface gi0/0.166
encapsulation dot1Q 166
ip address 10.0.166.254 255.255.255.0
interface gi0/0.167
encapsulation dot1Q 167
ip address 10.0.167.254 255.255.255.0
interface gi0/0.168
encapsulation dot1Q 168
ip address 10.0.168.254 255.255.255.0
interface gi0/0.169
encapsulation dot1Q 169
ip address 10.0.169.254 255.255.255.0
interface gi0/0.170
encapsulation dot1Q 170
ip address 10.0.170.254 255.255.255.0
interface gi0/0.171
encapsulation dot1Q 171
ip address 10.0.171.254 255.255.255.0
interface gi0/0.172
encapsulation dot1Q 172
ip address 10.0.172.254 255.255.255.0
interface gi0/0.173
encapsulation dot1Q 173
ip address 10.0.173.254 255.255.255.0
interface gi0/0.174
encapsulation dot1Q 174
ip address 10.0.174.254 255.255.255.0
interface gi0/0.175
encapsulation dot1Q 175
ip address 10.0.175.254 255.255.255.0
interface gi0/0.176
encapsulation dot1Q 176
ip address 10.0.176.254 255.255.255.0
interface gi0/0.177
encapsulation dot1Q 177
ip address 10.0.177.254 255.255.255.0
interface gi0/0.178
encapsulation dot1Q 178
ip address 10.0.178.254 255.255.255.0
interface gi0/0.179
encapsulation dot1Q 179
ip address 10.0.179.254 255.255.255.0
interface gi0/0.180
encapsulation dot1Q 180
ip address 10.0.180.254 255.255.255.0
interface gi0/0.181
encapsulation dot1Q 181
ip address 10.0.181.254 255.255.255.0
interface gi0/0.182
encapsulation dot1Q 182
ip address 10.0.182.254 255.255.255.0
interface gi0/0.183
encapsulation dot1Q 183
ip address 10.0.183.254 255.255.255.0
interface gi0/0.184
encapsulation dot1Q 184
ip address 10.0.184.254 255.255.255.0
interface gi0/0.185
encapsulation dot1Q 185
ip address 10.0.185.254 255.255.255.0
interface gi0/0.186
encapsulation dot1Q 186
ip address 10.0.186.254 255.255.255.0
interface gi0/0.187
encapsulation dot1Q 187
ip address 10.0.187.254 255.255.255.0
interface gi0/0.188
encapsulation dot1Q 188
ip address 10.0.188.254 255.255.255.0
interface gi0/0.189
encapsulation dot1Q 189
ip address 10.0.189.254 255.255.255.0
interface gi0/0.190
encapsulation dot1Q 190
ip address 10.0.190.254 255.255.255.0
interface gi0/0.191
encapsulation dot1Q 191
ip address 10.0.191.254 255.255.255.0
interface gi0/0.192
encapsulation dot1Q 192
ip address 10.0.192.254 255.255.255.0
interface gi0/0.193
encapsulation dot1Q 193
ip address 10.0.193.254 255.255.255.0
interface gi0/0.194
encapsulation dot1Q 194
ip address 10.0.194.254 255.255.255.0
interface gi0/0.195
encapsulation dot1Q 195
ip address 10.0.195.254 255.255.255.0
interface gi0/0.196
encapsulation dot1Q 196
ip address 10.0.196.254 255.255.255.0
interface gi0/0.197
encapsulation dot1Q 197
ip address 10.0.197.254 255.255.255.0
interface gi0/0.198
encapsulation dot1Q 198
ip address 10.0.198.254 255.255.255.0
interface gi0/0.199
encapsulation dot1Q 199
ip address 10.0.199.254 255.255.255.0
interface gi0/0.200
encapsulation dot1Q 200
ip address 10.0.200.254 255.255.255.0
interface gi0/0.201
encapsulation dot1Q 201
ip address 10.0.201.254 255.255.255.0
interface gi0/0.202
encapsulation dot1Q 202
ip address 10.0.202.254 255.255.255.0
interface gi0/0.203
encapsulation dot1Q 203
ip address 10.0.203.254 255.255.255.0
interface gi0/0.204
encapsulation dot1Q 204
ip address 10.0.204.254 255.255.255.0
interface gi0/0.205
encapsulation dot1Q 205
ip address 10.0.205.254 255.255.255.0
interface gi0/0.206
encapsulation dot1Q 206
ip address 10.0.206.254 255.255.255.0
interface gi0/0.207
encapsulation dot1Q 207
ip address 10.0.207.254 255.255.255.0
interface gi0/0.208
encapsulation dot1Q 208
ip address 10.0.208.254 255.255.255.0
interface gi0/0.209
encapsulation dot1Q 209
ip address 10.0.209.254 255.255.255.0
interface gi0/0.210
encapsulation dot1Q 210
ip address 10.0.210.254 255.255.255.0
interface gi0/0.211
encapsulation dot1Q 211
ip address 10.0.211.254 255.255.255.0
interface gi0/0.212
encapsulation dot1Q 212
ip address 10.0.212.254 255.255.255.0
interface gi0/0.213
encapsulation dot1Q 213
ip address 10.0.213.254 255.255.255.0
interface gi0/0.214
encapsulation dot1Q 214
ip address 10.0.214.254 255.255.255.0
interface gi0/0.215
encapsulation dot1Q 215
ip address 10.0.215.254 255.255.255.0
interface gi0/0.216
encapsulation dot1Q 216
ip address 10.0.216.254 255.255.255.0
interface gi0/0.217
encapsulation dot1Q 217
ip address 10.0.217.254 255.255.255.0
interface gi0/0.218
encapsulation dot1Q 218
ip address 10.0.218.254 255.255.255.0
interface gi0/0.219
encapsulation dot1Q 219
ip address 10.0.219.254 255.255.255.0
interface gi0/0.220
encapsulation dot1Q 220
ip address 10.0.220.254 255.255.255.0
interface gi0/0.221
encapsulation dot1Q 221
ip address 10.0.221.254 255.255.255.0
interface gi0/0.222
encapsulation dot1Q 222
ip address 10.0.222.254 255.255.255.0
interface gi0/0.223
encapsulation dot1Q 223
ip address 10.0.223.254 255.255.255.0
interface gi0/0.224
encapsulation dot1Q 224
ip address 10.0.224.254 255.255.255.0
interface gi0/0.225
encapsulation dot1Q 225
ip address 10.0.225.254 255.255.255.0
interface gi0/0.226
encapsulation dot1Q 226
ip address 10.0.226.254 255.255.255.0
interface gi0/0.227
encapsulation dot1Q 227
ip address 10.0.227.254 255.255.255.0
interface gi0/0.228
encapsulation dot1Q 228
ip address 10.0.228.254 255.255.255.0
interface gi0/0.229
encapsulation dot1Q 229
ip address 10.0.229.254 255.255.255.0
interface gi0/0.230
encapsulation dot1Q 230
ip address 10.0.230.254 255.255.255.0
interface gi0/0.231
encapsulation dot1Q 231
ip address 10.0.231.254 255.255.255.0
interface gi0/0.232
encapsulation dot1Q 232
ip address 10.0.232.254 255.255.255.0
interface gi0/0.233
encapsulation dot1Q 233
ip address 10.0.233.254 255.255.255.0
interface gi0/0.234
encapsulation dot1Q 234
ip address 10.0.234.254 255.255.255.0
interface gi0/0.235
encapsulation dot1Q 235
ip address 10.0.235.254 255.255.255.0
interface gi0/0.236
encapsulation dot1Q 236
ip address 10.0.236.254 255.255.255.0
interface gi0/0.237
encapsulation dot1Q 237
ip address 10.0.237.254 255.255.255.0
interface gi0/0.238
encapsulation dot1Q 238
ip address 10.0.238.254 255.255.255.0
interface gi0/0.239
encapsulation dot1Q 239
ip address 10.0.239.254 255.255.255.0
interface gi0/0.240
encapsulation dot1Q 240
ip address 10.0.240.254 255.255.255.0
interface gi0/0.241
encapsulation dot1Q 241
ip address 10.0.241.254 255.255.255.0
interface gi0/0.242
encapsulation dot1Q 242
ip address 10.0.242.254 255.255.255.0
interface gi0/0.243
encapsulation dot1Q 243
ip address 10.0.243.254 255.255.255.0
interface gi0/0.244
encapsulation dot1Q 244
ip address 10.0.244.254 255.255.255.0
interface gi0/0.245
encapsulation dot1Q 245
ip address 10.0.245.254 255.255.255.0
interface gi0/0.246
encapsulation dot1Q 246
ip address 10.0.246.254 255.255.255.0
interface gi0/0.247
encapsulation dot1Q 247
ip address 10.0.247.254 255.255.255.0
interface gi0/0.248
encapsulation dot1Q 248
ip address 10.0.248.254 255.255.255.0
interface gi0/0.249
encapsulation dot1Q 249
ip address 10.0.249.254 255.255.255.0
interface gi0/0.250
encapsulation dot1Q 250
ip address 10.0.250.254 255.255.255.0
interface gi0/0.251
encapsulation dot1Q 251
ip address 10.0.251.254 255.255.255.0
interface gi0/0.252
encapsulation dot1Q 252
ip address 10.0.252.254 255.255.255.0
interface gi0/0.253
encapsulation dot1Q 253
ip address 10.0.253.254 255.255.255.0
interface gi0/0.254
encapsulation dot1Q 254
ip address 10.0.254.254 255.255.255.0
interface gi0/0.255
encapsulation dot1Q 255
ip address 10.0.255.254 255.255.255.0
"
			   "\n" t))
  (with-output-from-comm sw2 "do sh flash"
			 (str)
			 (print "SSSUCCC")
			 (print str)
			 (sw-close sw2 name)))

(run-test-2)
