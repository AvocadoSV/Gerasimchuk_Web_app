# Используем официальный образ Python для Flask
FROM python:3.8-slim

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y \
   build-essential \
   libpq-dev \
   && rm -rf /var/lib/apt/lists/*

# Устанавливаем Flask и Gunicorn (HTTP сервер для Flask)
RUN pip install --upgrade pip
RUN pip install flask gunicorn

# Копируем код приложения в контейнер
COPY . /app
WORKDIR /app

# Экспонируем порт 5000 (порт, на котором будет работать Flask)
EXPOSE 5000

# Команда для запуска приложения
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
