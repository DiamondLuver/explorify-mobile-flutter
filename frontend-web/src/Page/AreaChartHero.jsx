import { AreaChart } from '@tremor/react';
import React from 'react';

const chartdata = [
  {
    date: 'Jan 22',
   Applied: 2890,
    'Hired': 2338,
  },
  {
    date: 'Feb 22',
   Applied: 2756,
    'Hired': 2103,
  },
  {
    date: 'Mar 22',
   Applied: 3322,
    'Hired': 2194,
  },
  {
    date: 'Apr 22',
   Applied: 3470,
    'Hired': 2108,
  },
  {
    date: 'May 22',
   Applied: 3475,
    'Hired': 1812,
  },
  {
    date: 'Jun 22',
   Applied: 3129,
    'Hired': 1726,
  },
  {
    date: 'Jul 22',
   Applied: 3490,
    'Hired': 1982,
  },
  {
    date: 'Aug 22',
   Applied: 2903,
    'Hired': 2012,
  },
  {
    date: 'Sep 22',
   Applied: 2643,
    'Hired': 2342,
  },
  {
    date: 'Oct 22',
   Applied: 2837,
    'Hired': 2473,
  },
  {
    date: 'Nov 22',
   Applied: 2954,
    'Hired': 3848,
  },
  {
    date: 'Dec 22',
   Applied: 3239,
    'Hired': 3736,
  },
];

const dataFormatter = (number) =>
  `$${Intl.NumberFormat('us').format(number).toString()}`;

const AreaChartHero = () => {
  return (
   
    <div className="p-8 space-y-12 bg-white rounded-lg shadow-md">
      <div className="flex items-center justify-between">
        <div className="flex items-center space-x-3">
          <span className="text-gray-500">All investments</span>
          <div className="text-xs px-2 py-1 text-indigo-800 bg-indigo-100 rounded-full">3 ETF</div>
        </div>
        <div className="flex items-center space-x-2">
          <span className="text-xs text-gray-500">Aug 1, 2023 - Oct 15, 2023</span>
          <span className="text-xs text-gray-500">Daily</span>
        </div>
      </div>

      <div className="h-80">
        <AreaChart
          data={chartdata}
          index="date"
          categories={['Applied', 'Hired']}
          colors={['red', 'amber']}
          valueFormatter={dataFormatter}
          yAxisWidth={60}
          lineWidth={2} // Adjust this value to make the line thicker
          onValueChange={(v) => console.log(v)}
        />
      </div>
      
    </div>
  );
};

export default AreaChartHero;
