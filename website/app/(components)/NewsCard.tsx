import Image from "next/image";
import Link from "next/link";
import * as React from "react";

interface NewsCardProps {
  title: string;
  description: string;
  imageUrl: string;
  linkurl:string;
}

export function NewsCard({ linkurl,title, description, imageUrl }: NewsCardProps) {
  return (
    <div className="bg-white m-4  overflow-y-hidden w-[18rem] h-[28rem] items-center border-2 rounded-lg flex flex-col mt-8">
      <Link href={linkurl} className="">
     
        <Image
          alt="newsimage"
          src={imageUrl}
          width={300}
          height={250}
          className="mt-4 m-3 w-[16.3rem] h-[12rem] self-center"
        />
      
      <div className="flex flex-col m-4">
        <p className="font-[700] hover:underline">{title}</p>
        <p className="text-sm  hover:underline mb-8  ">{description}</p>
      </div></Link>
    </div>
  );
}
