(* ::Package:: *)

aproksimacijaPi[n_]:=
Module[
	{StTockZnotrajKroga, StVsehTock, Rezultat, Tocke, TockeZ, x, y, P1, P2},
	StTockZnotrajKroga=0;
	StVsehTock=n;
	Tocke={};
	TockeZ={};
		For[i=1, i<=n, i++,
			x=2*RandomReal[]-1;
			y=2*RandomReal[]-1;
			If[x^2+y^2<=1,
				StTockZnotrajKroga++
				AppendTo[TockeZ, {x, y}]
			];
			AppendTo[Tocke, {x, y}]
		];
	Rezultat=4*StTockZnotrajKroga/StVsehTock;
	Print["Pribljizek stevila pi: "];
	Print[N[Rezultat, 3]];
	P1=ListPlot[Tocke,
		PlotRange->{{-1, 1}, {-1, 1}},
		AspectRatio->1,
		PlotStyle->{Blue, PointSize[0.01]},
		Epilog->Circle[{0, 0}, 1, {0, 2*Pi}]
	];
	P2=ListPlot[TockeZ,
		PlotRange->{{-1, 1}, {-1, 1}},
		AspectRatio->1,
		PlotStyle->{Red, PointSize[0.01]}
	];
	Show[P1, P2]
]
