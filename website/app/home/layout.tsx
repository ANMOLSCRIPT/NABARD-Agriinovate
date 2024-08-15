import Footer from "../(components)/Footer";
import Header from "../(components)/Header";



export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
  <div className="bg-gradient-to-b from-[#6B8F71] to-[#365A39] ">
    <Header/>
      <div className="">
        
        {children}</div>
        <Footer/>
    </div>
  );
}
