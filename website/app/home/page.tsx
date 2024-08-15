import axios from "axios";
import { NewsCard } from "../(components)/NewsCard";
import { TrendsCard } from "../(components)/TrendsCard";
import WeatherBox from "../(components)/WeatherBox";
import NewsPanel from "./components/NewsPanel";

export default async function Home() {
  return (
    <div className="">
      <div>
        <WeatherBox />
      </div>
      <div className="flex flex-col mt-10">
        <div className="self-center">
          <h1 className="text-3xl text-[#422F2F] ">NEWS</h1>
        </div>
        <div className="w-full">
          <NewsPanel />
        </div>
      </div>
      <div className="flex flex-col mt-10">
        <div className="self-center text-[#422F2F] text-3xl">
          <h1>TRENDS</h1>
        </div>
        <div className="flex  justify-evenly flex-wrap mb-10">
          <TrendsCard
            title={"राष्ट्रीय कृषि विकास योजना"}
            description={
              "आरकेवीवाई-रफ्तार एक केंद्रीय योजना है, जो कृषि और संबंधित क्षेत्रों के विकास को बढ़ावा देने के लिए 2007 में शुरू की गई थी। इसका उद्देश्य कृषि को लाभकारी बनाना, जोखिम कम करना, और कृषि व्यवसाय उद्यमिता को प्रोत्साहित करना है। योजना के तहत राज्यों को अवसंरचना, उत्पादन परियोजनाओं, और नवाचार के लिए निधियां दी जाती हैं।"
            }
            imageUrl={"/trend1.jpg"}
            linkurl={"https://rkvy.nic.in/"}
          />
          <TrendsCard
            title={"प्रधानमंत्री फ़सल बीमा योजना"}
            description={
              "फसल बीमा एक एकीकृत आईटी समाधान और एक वेब-आधारित पारिस्थितिकी तंत्र है जो सेवा वितरण में तेजी लाता है, खंडित डेटाबेस को एकीकृत करता है, डेटा का एकल दृश्य प्राप्त करता है और मैन्युअल प्रक्रियाओं को समाप्त करता है। फसल बीमा किसानों को पहले की तुलना में तेजी से बीमा सेवाएँ प्रदान करता है।"
            }
            imageUrl={"/trend2.jpg"}
            linkurl={"https://pmfby.gov.in"}
          />
          <TrendsCard
            title={"प्रधानमंत्री श्रम योगी मानधन योजना"}
            description={
              "प्रधानमंत्री श्रम योगी मानधन वृद्धावस्था संरक्षण और असंगठित श्रमिकों की सामाजिक सुरक्षा के लिए एक सरकारी योजना है।"
            }
            imageUrl={"/trend3.jpg"}
            linkurl={"https://pmkisan.gov.in"}
          />
        </div>
      </div>
    </div>
  );
}
