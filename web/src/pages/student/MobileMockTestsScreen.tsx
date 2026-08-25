import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Menu,
  Search,
  ArrowRight,
  ClipboardList,
  Clock,
  TrendingUp,
  Award,
  ChevronDown,
  Filter,
  Bookmark,
  FileText,
  Trophy,
  CheckCircle2,
} from 'lucide-react';

interface MobileMockTestsScreenProps {
  onOpenDrawer?: () => void;
  onStartTest?: (testId?: number) => void;
  onPreviewTest?: (testId?: number) => void;
  isMobileFrame?: boolean;
}

interface MockTestItem {
  id: number;
  title: string;
  isLatest?: boolean;
  subjects: string;
  syllabus: string;
  questions: number;
  marks: number;
  duration: string;
  iconBg: string;
  iconColor: string;
}

export const MobileMockTestsScreen: React.FC<MobileMockTestsScreenProps> = ({
  onOpenDrawer,
  onStartTest,
  onPreviewTest,
  isMobileFrame = false,
}) => {
  const navigate = useNavigate();

  // State
  const [activeCategoryTab, setActiveCategoryTab] = useState<string>('all');
  const [selectedClass, setSelectedClass] = useState<string>('Class 12');
  const [selectedExam, setSelectedExam] = useState<string>('NEET');
  const [selectedSubject, setSelectedSubject] = useState<string>('All Subjects');

  const handleStart = (id?: number) => {
    if (onStartTest) onStartTest(id);
    else navigate('/app/test');
  };

  const handlePreview = (id?: number) => {
    if (onPreviewTest) onPreviewTest(id);
    else navigate('/app/test');
  };

  const mockTestsList: MockTestItem[] = [
    {
      id: 1,
      title: 'NEET 2024 Mock Test - 1',
      isLatest: true,
      subjects: 'All Subjects',
      syllabus: 'Full Syllabus',
      questions: 180,
      marks: 720,
      duration: '3:20 Hrs',
      iconBg: 'bg-emerald-50',
      iconColor: 'text-emerald-600',
    },
    {
      id: 2,
      title: 'NEET 2024 Mock Test - 2',
      subjects: 'All Subjects',
      syllabus: 'Full Syllabus',
      questions: 180,
      marks: 720,
      duration: '3:20 Hrs',
      iconBg: 'bg-orange-50',
      iconColor: 'text-orange-600',
    },
    {
      id: 3,
      title: 'NEET 2024 Mock Test - 3',
      subjects: 'All Subjects',
      syllabus: 'Full Syllabus',
      questions: 180,
      marks: 720,
      duration: '3:20 Hrs',
      iconBg: 'bg-purple-50',
      iconColor: 'text-[#5D3EED]',
    },
  ];

  return (
    <div className={`w-full font-sans bg-[#FDFDFF] text-slate-900 select-none pb-16 ${isMobileFrame ? 'px-0 py-0' : 'max-w-md mx-auto min-h-screen shadow-xl rounded-3xl'}`}>
      
      {/* ========================================================================= */}
      {/* 1. TOP HEADER BAR */}
      {/* ========================================================================= */}
      <div className="bg-white px-4 py-3 border-b border-slate-100 flex items-center justify-between sticky top-0 z-30 shadow-xs">
        <button
          onClick={onOpenDrawer}
          className="p-1 text-slate-800 hover:text-[#5D3EED] transition-colors"
        >
          <Menu className="w-5 h-5 stroke-[2.5]" />
        </button>

        <h1 className="text-base font-black text-slate-900 text-center flex-1">
          Mock Tests
        </h1>

        <button className="p-1 text-slate-800 hover:text-[#5D3EED] transition-colors">
          <Search className="w-5 h-5 stroke-[2.5]" />
        </button>
      </div>

      <div className="p-4 space-y-4">
        
        {/* ========================================================================= */}
        {/* 2. HERO GRADIENT BANNER */}
        {/* ========================================================================= */}
        <div className="bg-gradient-to-r from-[#4F46E5] to-[#5D3EED] text-white p-5 rounded-3xl relative overflow-hidden shadow-lg shadow-indigo-600/20 flex items-center justify-between">
          <div className="space-y-2 z-10 max-w-[210px]">
            <h2 className="text-lg font-black leading-tight tracking-tight">
              Assess Yourself.<br />Improve Every Day.
            </h2>
            <p className="text-[11px] text-indigo-100 font-medium leading-normal">
              Take full length mock tests simulating the real exam.
            </p>
            <button
              onClick={() => handleStart(1)}
              className="mt-2 bg-white text-[#5D3EED] font-extrabold text-xs px-4 py-2.5 rounded-full hover:bg-purple-50 inline-flex items-center gap-1.5 shadow-md transition-all"
            >
              <span>Take a Test</span>
              <ArrowRight className="w-3.5 h-3.5" />
            </button>
          </div>

          {/* Right Clipboard & Clock Illustration Graphic */}
          <div className="relative z-10 flex-shrink-0">
            <div className="w-24 h-24 bg-white/10 rounded-2xl backdrop-blur-xs p-3 border border-white/20 shadow-inner flex flex-col items-center justify-center space-y-1.5">
              <div className="w-10 h-10 rounded-full bg-white text-[#5D3EED] flex items-center justify-center shadow-md">
                <CheckCircle2 className="w-6 h-6 text-[#5D3EED]" />
              </div>
              <div className="space-y-1 w-full text-center">
                <div className="w-12 h-1.5 bg-white/80 rounded-full mx-auto" />
                <div className="w-8 h-1.5 bg-white/60 rounded-full mx-auto" />
              </div>
            </div>
            
            {/* Clock Overlay Badge */}
            <div className="absolute -bottom-2 -right-2 bg-white text-[#5D3EED] p-2 rounded-full shadow-lg border-2 border-indigo-500">
              <Clock className="w-4 h-4" />
            </div>
          </div>

          {/* Background Decorative Circles */}
          <div className="absolute -top-10 -right-10 w-40 h-40 bg-white/10 rounded-full blur-xl pointer-events-none" />
          <div className="absolute -bottom-10 -left-10 w-32 h-32 bg-indigo-400/20 rounded-full blur-lg pointer-events-none" />
        </div>

        {/* ========================================================================= */}
        {/* 3. 4 METRIC QUICK SUMMARY CARDS GRID */}
        {/* ========================================================================= */}
        <div className="grid grid-cols-4 gap-2.5">
          {/* Card 1: Tests Taken */}
          <div className="bg-white border border-slate-200/80 rounded-2xl p-2.5 text-center shadow-xs flex flex-col items-center justify-center">
            <div className="w-9 h-9 rounded-2xl bg-blue-50 text-blue-600 flex items-center justify-center">
              <ClipboardList className="w-4 h-4" />
            </div>
            <span className="text-sm font-black text-slate-900 mt-1.5 block">32</span>
            <span className="text-[9px] text-slate-400 font-bold block">Tests Taken</span>
          </div>

          {/* Card 2: Avg. Score */}
          <div className="bg-white border border-slate-200/80 rounded-2xl p-2.5 text-center shadow-xs flex flex-col items-center justify-center">
            <div className="w-9 h-9 rounded-2xl bg-orange-50 text-orange-600 flex items-center justify-center">
              <Clock className="w-4 h-4" />
            </div>
            <span className="text-sm font-black text-slate-900 mt-1.5 block">78%</span>
            <span className="text-[9px] text-slate-400 font-bold block">Avg. Score</span>
          </div>

          {/* Card 3: Best Score */}
          <div className="bg-white border border-slate-200/80 rounded-2xl p-2.5 text-center shadow-xs flex flex-col items-center justify-center">
            <div className="w-9 h-9 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center">
              <TrendingUp className="w-4 h-4" />
            </div>
            <span className="text-sm font-black text-slate-900 mt-1.5 block">1280</span>
            <span className="text-[9px] text-slate-400 font-bold block">Best Score</span>
          </div>

          {/* Card 4: Hours Practiced */}
          <div className="bg-white border border-slate-200/80 rounded-2xl p-2.5 text-center shadow-xs flex flex-col items-center justify-center">
            <div className="w-9 h-9 rounded-2xl bg-purple-50 text-[#5D3EED] flex items-center justify-center">
              <Award className="w-4 h-4 text-[#5D3EED]" />
            </div>
            <span className="text-sm font-black text-slate-900 mt-1.5 block">15</span>
            <span className="text-[9px] text-slate-400 font-bold block">Hours Practiced</span>
          </div>
        </div>

        {/* ========================================================================= */}
        {/* 4. TEST CATEGORY FILTER TABS (HORIZONTAL SEGMENTED BAR) */}
        {/* ========================================================================= */}
        <div className="bg-slate-100/70 p-1 rounded-2xl flex items-center justify-between text-xs font-bold text-slate-600">
          <button
            onClick={() => setActiveCategoryTab('all')}
            className={`flex-1 py-2 rounded-xl text-center transition-all ${
              activeCategoryTab === 'all'
                ? 'bg-white text-[#5D3EED] font-black shadow-xs'
                : 'hover:text-slate-900'
            }`}
          >
            All Tests
          </button>

          <button
            onClick={() => setActiveCategoryTab('full')}
            className={`flex-1 py-2 rounded-xl text-center transition-all ${
              activeCategoryTab === 'full'
                ? 'bg-white text-[#5D3EED] font-black shadow-xs'
                : 'hover:text-slate-900'
            }`}
          >
            Full Test
          </button>

          <button
            onClick={() => setActiveCategoryTab('chapter')}
            className={`flex-1 py-2 rounded-xl text-center transition-all ${
              activeCategoryTab === 'chapter'
                ? 'bg-white text-[#5D3EED] font-black shadow-xs'
                : 'hover:text-slate-900'
            }`}
          >
            Chapter Test
          </button>

          <button
            onClick={() => setActiveCategoryTab('subject')}
            className={`flex-1 py-2 rounded-xl text-center transition-all ${
              activeCategoryTab === 'subject'
                ? 'bg-white text-[#5D3EED] font-black shadow-xs'
                : 'hover:text-slate-900'
            }`}
          >
            Subject Test
          </button>
        </div>

        {/* ========================================================================= */}
        {/* 5. DROPDOWN FILTERS & FILTER BUTTON ROW */}
        {/* ========================================================================= */}
        <div className="flex items-center gap-2 overflow-x-auto custom-scrollbar">
          {/* Class Dropdown */}
          <div className="flex items-center gap-1 bg-white border border-slate-200/80 rounded-xl px-3 py-1.5 text-xs font-bold text-slate-700 flex-shrink-0 cursor-pointer shadow-xs">
            <span>{selectedClass}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400" />
          </div>

          {/* Exam Dropdown */}
          <div className="flex items-center gap-1 bg-white border border-slate-200/80 rounded-xl px-3 py-1.5 text-xs font-bold text-slate-700 flex-shrink-0 cursor-pointer shadow-xs">
            <span>{selectedExam}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400" />
          </div>

          {/* Subject Dropdown */}
          <div className="flex items-center gap-1 bg-white border border-slate-200/80 rounded-xl px-3 py-1.5 text-xs font-bold text-slate-700 flex-shrink-0 cursor-pointer shadow-xs">
            <span>{selectedSubject}</span>
            <ChevronDown className="w-3.5 h-3.5 text-slate-400" />
          </div>

          {/* Filter Icon Button */}
          <button className="p-2 rounded-xl bg-purple-50 text-[#5D3EED] border border-purple-100 flex items-center justify-center flex-shrink-0 hover:bg-purple-100 transition-colors">
            <Filter className="w-4 h-4 text-[#5D3EED]" />
          </button>
        </div>

        {/* ========================================================================= */}
        {/* 6. FULL LENGTH MOCK TESTS CARDS STACK */}
        {/* ========================================================================= */}
        <div className="space-y-3.5 pt-1">
          <div className="flex items-center justify-between">
            <h3 className="text-sm font-extrabold text-slate-900">
              Full Length Mock Tests
            </h3>
            <button className="text-[#5D3EED] font-extrabold text-xs hover:underline">
              View All
            </button>
          </div>

          <div className="space-y-3.5">
            {mockTestsList.map((test) => (
              <div
                key={test.id}
                className="bg-white border border-slate-200/80 rounded-3xl p-4 space-y-3 shadow-xs hover:border-indigo-300 transition-all"
              >
                {/* Top Title & Icon Row */}
                <div className="flex items-start justify-between">
                  <div className="flex items-start gap-3">
                    <div className={`w-10 h-10 rounded-2xl ${test.iconBg} ${test.iconColor} flex items-center justify-center flex-shrink-0 mt-0.5`}>
                      <ClipboardList className="w-5 h-5" />
                    </div>

                    <div className="space-y-0.5">
                      <div className="flex items-center gap-2">
                        <h4 className="text-sm font-extrabold text-slate-900">
                          {test.title}
                        </h4>
                        {test.isLatest && (
                          <span className="px-2 py-0.5 rounded-md bg-emerald-100 text-emerald-700 text-[9px] font-extrabold uppercase tracking-wider">
                            Latest
                          </span>
                        )}
                      </div>
                      <p className="text-xs text-slate-400 font-bold">
                        {test.subjects} • {test.syllabus}
                      </p>
                    </div>
                  </div>

                  <button className="text-slate-400 hover:text-[#5D3EED] transition-colors p-1">
                    <Bookmark className="w-4 h-4" />
                  </button>
                </div>

                {/* Meta Stats Row */}
                <div className="flex items-center gap-4 text-xs font-bold text-slate-600 pt-1">
                  <div className="flex items-center gap-1.5">
                    <FileText className="w-3.5 h-3.5 text-slate-400" />
                    <span>{test.questions} Qs</span>
                  </div>

                  <div className="flex items-center gap-1.5">
                    <Trophy className="w-3.5 h-3.5 text-slate-400" />
                    <span>{test.marks} Marks</span>
                  </div>

                  <div className="flex items-center gap-1.5">
                    <Clock className="w-3.5 h-3.5 text-slate-400" />
                    <span>{test.duration}</span>
                  </div>
                </div>

                {/* Action Buttons (2-Column Grid) */}
                <div className="grid grid-cols-2 gap-3 pt-1">
                  <button
                    onClick={() => handlePreview(test.id)}
                    className="py-2.5 rounded-xl border border-[#5D3EED] text-[#5D3EED] bg-white font-extrabold text-xs hover:bg-purple-50 transition-colors flex items-center justify-center gap-1.5 shadow-xs"
                  >
                    <span>Preview</span>
                  </button>

                  <button
                    onClick={() => handleStart(test.id)}
                    className="py-2.5 rounded-xl bg-[#5D3EED] hover:bg-[#4F46E5] text-white font-extrabold text-xs transition-colors flex items-center justify-center gap-1.5 shadow-sm"
                  >
                    <span>Start Test</span>
                  </button>
                </div>

              </div>
            ))}
          </div>

        </div>

      </div>

    </div>
  );
};
