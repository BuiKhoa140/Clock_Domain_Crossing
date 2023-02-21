# Clock_Domain_Crossing
## Clock Domain Crossing (CDC) là gì?
* Clock Domain Crossing được định nghĩa là việc truyền một tín hiệu, hay dữ liệu giữa hai vùng mạch số bất đồng bộ.
* Các mạch số sử dụng flip-flop luôn cần tín hiệu xung clock để chốt dữ liệu đầu ra. Trong những chip SoCs, với việc tích hợp nhiều module trong cùng một con chip đã dẫn đến việc chuyển đổi dữ liệu giữa các vùng có xung clock với tần số khác nhau, hoặc từ các nguồn khác nhau là điều không thể tránh khỏi. Nhưng khi ta truyền dữ liệu trực tiếp giữa 2 vùng sử dụng xung clock khác nhau thì việc bất đồng bộ sẽ xảy ra, và gây ra xung đột.
* Hai vùng được xem là đồng bộ (synchronous) khi và chỉ khi tất cả các flip-flop được điều khiển bởi một xung clock từ một nguồn duy nhất. Hai vùng được xem là bất đồng bộ (asynchronous) khi các flip-flop ở vùng đó sử dụng 2 xung clock khác nhau về tần số, ngay cả khi chúng sử dụng xung clock có cùng tần số nhưng lấy từ 2 nguồn khác nhau cũng được coi là bất đồng bộ.
 
![image](https://user-images.githubusercontent.com/93174030/220411996-eeae731f-8b99-4429-8b12-a18922504fb4.png)
