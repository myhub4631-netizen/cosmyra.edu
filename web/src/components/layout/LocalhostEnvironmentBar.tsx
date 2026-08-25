import React from 'react';
import { ExternalLink, Globe, Smartphone, User, Shield, Sparkles } from 'lucide-react';

export const LocalhostEnvironmentBar: React.FC = () => {
  const currentPort = window.location.port || '3000';
  const currentPath = window.location.pathname;

  const apps = [
    {
      name: 'User Website',
      port: '3000',
      url: 'http://localhost:3000/dashboard',
      icon: Globe,
      color: 'bg-indigo-600 text-white',
      activeColor: 'bg-indigo-600 text-white shadow-md shadow-indigo-600/30',
    },
    {
      name: 'User App',
      port: '3001',
      url: 'http://localhost:3001/dashboard',
      icon: Smartphone,
      color: 'bg-blue-600 text-white',
      activeColor: 'bg-blue-600 text-white shadow-md shadow-blue-600/30',
    },
    {
      name: 'Teacher Website',
      port: '3002',
      url: 'http://localhost:3002/dashboard',
      icon: User,
      color: 'bg-purple-600 text-white',
      activeColor: 'bg-purple-600 text-white shadow-md shadow-purple-600/30',
    },
    {
      name: 'Teacher App',
      port: '3003',
      url: 'http://localhost:3003/dashboard',
      icon: Smartphone,
      color: 'bg-amber-600 text-white',
      activeColor: 'bg-amber-600 text-white shadow-md shadow-amber-600/30',
    },
    {
      name: 'Admin Dashboard',
      port: '3004',
      url: 'http://localhost:3004/dashboard',
      icon: Shield,
      color: 'bg-emerald-600 text-white',
      activeColor: 'bg-emerald-600 text-white shadow-md shadow-emerald-600/30',
    },
  ];

  return (
    <div className="bg-slate-950 text-slate-200 border-b border-slate-800 px-4 py-2 flex flex-wrap items-center justify-between gap-3 text-xs z-50 font-sans">
      <div className="flex items-center gap-2">
        <Sparkles className="w-4 h-4 text-indigo-400 animate-pulse" />
        <span className="font-bold text-white text-xs tracking-tight">COSMYRA MULTI-LOCALHOST SERVERS</span>
        <span className="text-[10px] text-slate-400 font-mono bg-slate-900 px-2 py-0.5 rounded border border-slate-800">
          Port: {currentPort} | Path: {currentPath}
        </span>
      </div>

      {/* Port Badges */}
      <div className="flex items-center gap-2 flex-wrap">
        {apps.map((app) => {
          const Icon = app.icon;
          const isActive = currentPort === app.port;
          return (
            <a
              key={app.port}
              href={app.url}
              className={`flex items-center gap-1.5 px-3 py-1 rounded-lg text-xs font-bold transition-all ${
                isActive
                  ? app.activeColor
                  : 'bg-slate-900 text-slate-400 hover:text-slate-100 hover:bg-slate-800 border border-slate-800'
              }`}
            >
              <Icon className="w-3.5 h-3.5" />
              <span>{app.name}</span>
              <span className="text-[10px] opacity-75 font-mono">(:{app.port})</span>
              <ExternalLink className="w-3 h-3 opacity-60 ml-0.5" />
            </a>
          );
        })}
      </div>
    </div>
  );
};
