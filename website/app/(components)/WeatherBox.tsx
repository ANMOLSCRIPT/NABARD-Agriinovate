"use client";

import React, { useEffect, useState } from "react";
import Image from "next/image";

function WeatherBox() {
  const [weather, setWeather] = useState({ temp: "", condition: "", icon: "" });

  const weatherdata = async () => {
    try {
      const res = await fetch(
        "http://api.weatherapi.com/v1/forecast.json?key=7c52c1ad48cc4be99d514606240808&q=delhi,india&days=1&aqi=no&alerts=no"
      );
      if (!res.ok) {
        throw new Error("Failed to fetch data");
      }
      const data = await res.json();
      return {
        temp: data.current.temp_c,
        condition: data.current.condition.text,
        icon: data.current.condition.icon,
      };
    } catch (error) {
      console.error(error);
      return null;
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      const data = await weatherdata();
      if (data) {
        setWeather(data); // Adjust based on your API response
      }
    };

    fetchData();
  }, []);

  return (
   <div className="flex items-center mt-4 justify-center ">
      <div className="bg-white self-center m items-center w-[16rem] h-fit gap-2 sm:hidden border-2 shadow-md rounded-lg p-6">
        {weather.temp && weather.condition ? (
          <div className="text-gray-800 mr-6 flex flex-col  items-center">
            <p> Temp: {weather.temp}°C</p>
            <p>
              <Image
                alt="weather"
                className="inline"
                src={`https:${weather.icon}`}
                width={24}
                height={24}
              />{" "}
              {weather.condition}
            </p>
          </div>
        ) : (
          <p className="text-gray-800">Loading...</p>
        )}
      </div>
      </div>
  );
}

export default WeatherBox;
