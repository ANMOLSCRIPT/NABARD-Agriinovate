"use client";

import React from "react";
import Image from "next/image";

const Footer = () => {
  return (
    <footer className="bg-[#002400] text-white py-6">
      <div className="container mx-auto flex flex-col md:flex-row justify-between items-center">
        
        {/* Logo and Branding */}
        <div className="mb-4 md:mb-0">
          <Image alt="logo" src="/logo/image.png" width={50} height={50} />
          <p className="text-sm mt-2">Agrinovate</p>
        </div>

        {/* Navigation Links */}
        <div className="flex gap-6 mb-3 md:mb-0">
          <a href="#home" className="hover:underline">Home</a>
          <a href="#dashboard" className="hover:underline">Dashboard</a>
          <a href="#news" className="hover:underline">News</a>
        </div>

        {/* Social Media Icons */}
        <div className="flex gap-4">
          <a href="#facebook" aria-label="Facebook">
            <Image alt="Facebook" src="/fb/image.png" width={24} height={24} />
          </a>
          <a href="#twitter" aria-label="Twitter">
            <Image alt="Twitter" src="/twitter/image.png" width={24} height={24} />
          </a>
          <a href="#instagram" aria-label="Instagram">
            <Image alt="Instagram" src="/insta/image.png" width={24} height={24} />
          </a>
        </div>

      </div>
      
      {/* Copyright Information */}
      <div className="text-center mt-8 text-gray-400 text-sm">
        © 2024 Agrinovate. All rights reserved.
      </div>
    </footer>
  );
};

export default Footer;
