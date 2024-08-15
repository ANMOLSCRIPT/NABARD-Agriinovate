import Image from "next/image";
import * as React from "react";
import Link from "next/link";

interface TrendsCardProps {
  title: string;
  description: string;
  imageUrl: string;
  linkurl:string;
}

export function TrendsCard({ linkurl,title, description, imageUrl }: TrendsCardProps) {
  return (
    <div className="bg-white m-4  overflow-y-hidden w-[18rem] h-[28rem] items-center border-2 rounded-lg flex flex-col mt-8">
      <Link href={linkurl} className="">
      <div>
        <Image
          alt="trendsimage"
          src={imageUrl}
          width={300}
          height={250}
          className="mt-4 m-3 w-[16.3rem] h-[12rem] self-center"
        />
      </div>
      <div className="flex flex-col m-4">
        <p className="font-[700]">{title}</p>
        <p className="text-sm mb-8">
        {description}
        </p>

      </div></Link>
    </div>
  );
}
