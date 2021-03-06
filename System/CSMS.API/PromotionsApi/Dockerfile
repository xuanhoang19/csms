#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["PromotionsApi/PromotionsApi.csproj", "PromotionsApi/"]
COPY ["PromotionsApi.Framework/PromotionsApi.Framework.csproj", "PromotionsApi.Framework/"]
COPY ["PromotionsApi.Business/PromotionsApi.Business.csproj", "PromotionsApi.Business/"]
COPY ["PromotionsApi.Data/PromotionsApi.Data.csproj", "PromotionsApi.Data/"]
COPY ["PromotionsApi.Common/PromotionsApi.Common.csproj", "PromotionsApi.Common/"]
COPY ["PromotionsApi.Constants/PromotionsApi.Constants.csproj", "PromotionsApi.Constants/"]
RUN dotnet restore "PromotionsApi/PromotionsApi.csproj"
COPY . .
WORKDIR "/src/PromotionsApi"
RUN dotnet build "PromotionsApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "PromotionsApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "PromotionsApi.dll"]