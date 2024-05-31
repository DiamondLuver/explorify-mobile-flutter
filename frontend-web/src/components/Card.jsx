import React from 'react'

const Card = () => {
  return (
  <>
  		{/* Main Content */}
<main className="h-full overflow-y-auto  max-w-full  pt-4">
  <div className="container full-container py-5 flex flex-col gap-6">
    <div className="card">
      <div className="card-body">
        <div className="grid grid-cols-1 lg:grid-cols-3 lg:gap-x-6 gap-x-0 lg:gap-y-0 gap-y-6">
          <div className="flex flex-col gap-6">
            <h6 className="text-lg text-gray-600 font-semibold">Card</h6>
            <div className="card overflow-hidden">
              <div className=" bg-white">
                <img className="w-full h-auto rounded-t-xl" src="../assets/images/products/product-1.jpg" alt="Image Description" />
                <div className="card-body">
                  <h3 className="text-lg font-medium text-gray-700">
                    Card title
                  </h3>
                  <p className="mt-1 text-sm text-gray-500 pr-10 ">
                    Some quick example text to build on the card title and make up the bulk of the card's content.
                  </p>
                  <a className="mt-4 py-2 px-3 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-md border border-transparent bg-blue-600 text-white hover:bg-blue-700 " href="#">
                    Go somewhere
                  </a>
                </div>
              </div>                                                
            </div>
          </div>
          <div className="flex flex-col gap-6">
            <h6 className="text-lg text-gray-600 font-semibold">Header and footer</h6>
            <div className="card">
              <div className="py-4 px-7 ">
                <p className="mt-1 text-sm text-gray-500">
                  Featured
                </p>
              </div>
              <div className="card-body">
                <h3 className="text-lg font-medium text-gray-600 mb-2">
                  Special title treatment
                </h3>
                <p className="text-sm text-gray-500 pe-10">
                  With supporting text below as a natural lead-in to additional content.
                </p>
                <a className="mt-4 py-2 px-3 inline-flex justify-center items-center gap-x-2 text-sm font-semibold rounded-md border border-transparent bg-blue-600 text-white hover:bg-blue-700 " href="#">
                  Go somewhere
                </a>
              </div>                                              
            </div>
          </div>
          <div className="flex flex-col gap-6">
            <h6 className="text-lg text-gray-600 font-semibold">Titles, text, and links</h6>
            <div className="card">
              <div className="card-body">
                <div className="flex flex-col">
                  <h3 className="text-lg font-medium text-gray-600">
                    Card title
                  </h3>
                  <p className=" text-sm font-medium  text-gray-500 dark:text-gray-500">
                    Card subtitle
                  </p>
                  <p className="mt-2 text-sm text-gray-500 pe-10">
                    Some quick example text to build on the card title and make up the bulk of the card's content.
                  </p>
                  <div className="flex gap-2">
                    <a className="mt-3 inline-flex items-center gap-x-1 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-700" href="#">
                      Card link
                      <i className="ti ti-chevron-right text-base" />
                    </a>
                    <a className="mt-3 inline-flex items-center gap-x-1 text-sm font-semibold rounded-lg border border-transparent text-blue-600 hover:text-blue-700" href="#">
                      Another link
                      <i className="ti ti-chevron-right text-base" />
                    </a>
                  </div>
                </div>
              </div>                                              
            </div>
          </div>
        </div>                                   								
      </div>
    </div>
  </div>
</main>
{/* Main Content End */}

  </>
    
  )
}

export default Card