"use client";

import React, { useEffect, useState } from "react";
import Image from "next/image";
import Link from "next/link";

import { usePathname } from "next/navigation";

const Header = () => {
  const [weather, setWeather] = useState({ temp: '', condition: '' ,icon:''});
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const path= usePathname().toLocaleLowerCase()
 

  const weatherdata = async () => {
    try {
      const res = await fetch(
        "http://api.weatherapi.com/v1/forecast.json?key=7c52c1ad48cc4be99d514606240808&q=delhi,india&days=1&aqi=no&alerts=no"
      );
      if (!res.ok) {
        throw new Error("Failed to fetch data");
      }
      const data = await res.json();
      return { temp: data.current.temp_c, condition: data.current.condition.text,icon:data.current.condition.icon };
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


  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  const closeMenu = () => {
    setIsMenuOpen(false);
  };

  return (
    <div className="bg-[#002400] text-white p-5 shadow-sm  flex justify-between items-center relative">
      <div className="flex justify-center items-center px-4">
        <Image alt="logo" src="/logo/image.png" width={50} height={50} />
        <p className="font-bold pl-1 text-lg">Agrinovate</p>
      </div>
       <div className="items-center gap-2 hidden sm:flex">
        {weather.temp && weather.condition ? (
          <div className="text-white mr-6 flex flex-col  items-center">
           <p className="text-white mr-6 flex flex-col  items-center"> Temp: {weather.temp}°C</p>
           <p><Image alt="weather"className="inline" src={`https:${weather.icon}`} width={24}  height={24}/> {weather.condition}</p>
          </div>
        ) : (
          <p className="text-white">Loading...</p>
        )}
      </div>

      <div className="hidden md:flex gap-6 px-6 " >
        <Link href={"/home" } className={`hover:underline ${path=="/home"? "text-blue-200 hover:no-underline":"text-white"}`}>Home</Link>
        <Link href={"/home/news"} className={`hover:underline ${path=="/home/news"? "text-blue-200 hover:no-underline":"text-white"}`}>News</Link>
        <Link href={"/home/trends" } className={`hover:underline ${path=="/home/trends"? "text-blue-200 hover:no-underline":"text-white"}`}>Trends</Link>
      </div>

     

      <div className="md:hidden">
        <button onClick={toggleMenu} className="focus:outline-none transition-transform duration-300 transform" style={{ transform: isMenuOpen ? 'rotate(90deg)' : 'rotate(0deg)' }}>
          <Image alt="navbar" src="/navicon/image.png" width={25} height={25} />
        </button>
      </div>

      <div
        className={ ` z-40 absolute top-[4.3rem] left-0 w-full bg-white shadow-lg transform transition-all duration-300 ${
          isMenuOpen ? 'opacity-100 translate-y-0' : 'opacity-0 -translate-y-full'
        } md:hidden`}
      >
        {isMenuOpen && (
          <div className="flex  flex-col items-center gap-4 p-4 ">
            <a href="/home" className="text-gray-800" onClick={closeMenu}>Home</a>
            <a href="#dashboard" className="text-gray-800" onClick={closeMenu}>Dashboard</a>
            <a href="#news" className="text-gray-800" onClick={closeMenu}>News</a>
          </div>
        )}
      </div>
    </div>
  );
};

export default Header;
