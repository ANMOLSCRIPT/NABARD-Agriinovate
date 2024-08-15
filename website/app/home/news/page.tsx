"use client"

import { NewsCard } from '@/app/(components)/NewsCard';
import { useEffect, useState } from 'react';

interface NewsArticle {
  title: string;
  description: string;
  image_url: string;
}

export default function Home() {
  const [news, setNews] = useState<NewsArticle[] | null>(null);

  const newsdata = async () => {
    try {
      const res = await fetch(
        "https://newsdata.io/api/1/latest?apikey=pub_50404d2273d7208720fff71da66513ba3d054&q=crop&country=in&language=hi&image=1&timezone=Asia/Kolkata&removeduplicate=1"
      );
      if (!res.ok) {
        throw new Error("Failed to fetch data");
      }
      const data = await res.json();
      return  data.results.slice(0, 8);
    } catch (error) {
      console.error(error);
      return null;
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      const data = await newsdata();
      if (data) {
        
        setNews(data);
      }
    };

    fetchData();
  }, []);

  return (
    <div className='flex flex-wrap justify-evenly my-10'>
      {news && news.map((article, index) => (
       
        <NewsCard
          key={index}
          title={article.title}
          description={article.description}
          imageUrl={article.image_url}
          linkurl={article.link}
        />
      ))}
    </div>
  );
}
