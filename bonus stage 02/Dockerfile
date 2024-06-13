FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Run ./_tools/docker/net-restore.h if project|package updates
ADD net-restore.tar .
RUN dotnet restore "Mila/Api.csproj"

COPY . .
WORKDIR "/src/Api"
RUN dotnet build "Api.csproj" \
            --no-restore \
            -c Release \
            -o /app/build

FROM build AS publish
RUN dotnet publish "Api.csproj" \ 
            --no-restore \
            -c Release \
            -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

ENTRYPOINT ["./Api"]
CMD ["--endpoint", "http://api:80"]