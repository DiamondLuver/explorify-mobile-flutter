import axios from 'axios';
import React, { useState } from 'react';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css'; // import styles

const Test = () => {
 

  return (
    <>
   
    
<section className="text-blueGray-700 bg-white mt-20">
  <div className="container flex flex-col items-center px-5 py-16 mx-auto md:flex-row lg:px-28">
    <div className="flex flex-col items-start mb-16 text-left lg:flex-grow md:w-1/2 lg:pr-24 md:pr-16 md:mb-0">
      <h2 className="mb-8 text-xs font-semibold tracking-widest text-black uppercase title-font"> Your tagline </h2>
      <h1 className="mb-8 text-xl font-black tracking-tighter text-black md:text-3xl title-font"> Medium length display headline. </h1>
      <p className="mb-8 text-base leading-relaxed text-left text-blueGray-600 "> Deploy your mvp in minutes, not days. WT offers you a a wide selection swapable sections for your landing page. </p>
      <div className="flex flex-col justify-center lg:flex-row">
        <button className="flex items-center px-6 py-2 mt-auto font-semibold text-white transition duration-500 ease-in-out transform bg-blue-600 rounded-lg hover:bg-blue-700 focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2"> Show me </button>
        <p className="mt-2 text-sm text-left text-blueGray-600 md:ml-6 md:mt-0"> It will take you to candy shop. <br className="hidden lg:block" />
          <a href="#" className="inline-flex items-center font-semibold text-blue-600 md:mb-2 lg:mb-0 hover:text-black " title="read more"> Read more about it » </a>
        </p>
      </div>
    </div>
    <div className="w-full lg:w-1/3 lg:max-w-lg md:w-1/2">
      <img className="object-cover object-center rounded-lg " alt="hero" src="https://dummyimage.com/720x600/F3F4F7/8693ac" />
    </div>

  </div>

  

  <article className="font-fira mx-auto max-w-3xl p-4 selection:bg-black selection:text-white">

   <div class="container mx-auto max-w-5xl grid gap-12 grid-cols-1 md:grid-cols-3 items-start justify-center">
    <div class="grid gap-6 justify-items-center text-center">
        <div class="rounded-full border-8 border-amber-400 p-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
            </svg>
        </div>
        <h3 class="text-md font-bold">Head Offiec</h3>
        <p>Our products are secure and private out-of-the-box</p>
    </div>

    <div class="grid gap-6 justify-items-center text-center">
        <div class="rounded-full border-8 border-amber-400 p-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
            </svg>
        </div>
        <h3 class="text-md font-bold">Safe</h3>
        <p>Our products are secure and private out-of-the-box</p>
    </div>

    <div class="grid gap-6 justify-items-center text-center">
        <div class="rounded-full border-8 border-amber-400 p-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
            </svg>
        </div>
        <h3 class="text-md font-bold">Safe</h3>
        <p>Our products are secure and private out-of-the-box</p>
    </div>

    <div class="grid gap-6 justify-items-center text-center">
        <div class="rounded-full border-8 border-amber-400 p-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
            </svg>
        </div>
        <h3 class="text-md font-bold">Safe</h3>
        <p>Our products are secure and private out-of-the-box</p>
    </div>

    <div class="grid gap-6 justify-items-center text-center">
        <div class="rounded-full border-8 border-amber-400 p-4">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M16.5 10.5V6.75a4.5 4.5 0 10-9 0v3.75m-.75 11.25h10.5a2.25 2.25 0 002.25-2.25v-6.75a2.25 2.25 0 00-2.25-2.25H6.75a2.25 2.25 0 00-2.25 2.25v6.75a2.25 2.25 0 002.25 2.25z"></path>
            </svg>
        </div>
        <h3 class="text-md font-bold">Safe</h3>
        <p>Our products are secure and private out-of-the-box</p>
    </div>
</div>

  <section className="mt-12">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">Location</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <p className="mt-6 text-lg dark:text-neutral-200">Location : </p>
                    <iframe
                        src={`https://www.google.com/maps/embed?pb=`}
                        className="rounded-lg w-full h-64 pt-5"
                        style={{ border: 0 }}
                        allowFullScreen
                        loading="lazy"
                        referrerPolicy="no-referrer-when-downgrade"
                        title="Company Location"
                    />
                </section>
                </article>
</section>



    </>
  );
};

export default Test;
