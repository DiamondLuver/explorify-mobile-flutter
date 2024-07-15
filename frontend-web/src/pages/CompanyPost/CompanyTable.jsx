import axios from "axios";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import AddProfile from "./AddProfile";
import DeleteProfile from "./DeleteProfile";
import Edit from "./Edit";
import Header from "./Header";

const CompanyTable = () => {
  const [programs, setPrograms] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:8989/api/v1/company/list/")
      .then((response) => setPrograms(response.data))
      .catch((error) => console.error("Error fetching data: ", error));
  }, []);

  return (
    <>
      <Header />
      <section className="py-10 sm:py-5">
        <div className="mx-auto max-w-screen-2xl lg:px-1">
          <div className="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
            <AddProfile />
          </div>
        </div>

        <div className="py-8">
          <div className="container mx-auto px-2">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
              {programs.map((program) => (
                <div className="bg-white rounded-lg shadow-lg p-8">
                  <div className="relative overflow-hidden">
                    <img
                      className="object-cover w-32 h-30"
                      src="https://i.pinimg.com/474x/8b/ec/c7/8becc728a7cb5158329e7fc7c0a062b0.jpg"
                      alt="Product"
                    />
                    <div className="absolute inset-0 bg-black opacity-40" />
                    <div className="absolute inset-0 flex items-center justify-center">
                      <Link to={`/details/company/${program.company_id}`}>
                        <button className="bg-white text-gray-900 py-2 px-6 rounded-full font-bold hover:bg-gray-300">
                          View detail
                        </button>
                      </Link>
                    </div>
                  </div>
                  <h3 className="text-xl font-bold text-gray-900 mt-4">
                    {program.company_name}
                  </h3>
                  <p className="text-gray-500 text-sm mt-2">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed
                    sed ante justo. Integer euismod libero id mauris malesuada
                    tincidunt.
                  </p>
                  <div className="flex items-center justify-between mt-4">
                    <span className="text-gray-900 font-bold text-lg">
                      <Edit companyId={program.company_id} />
                    </span>

                    <DeleteProfile companyId={program.company_id} />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>
    </>
  );
};

export default CompanyTable;
