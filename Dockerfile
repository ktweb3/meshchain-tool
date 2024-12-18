# 使用官方 Golang 镜像作为基础镜像
FROM golang:1.23.2

# 设置工作目录
WORKDIR /app

# 复制 go.mod 和 go.sum 文件
COPY go.mod go.sum main.go ./

# 下载依赖
RUN go mod tidy

# 复制源代码
COPY . .

# 编译应用
RUN go build -o main .

# 设置容器启动时执行的命令
CMD ["./main"]