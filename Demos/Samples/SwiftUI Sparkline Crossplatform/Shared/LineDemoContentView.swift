//
//  LineDemoContentView.swift
//  SwiftUI Demo
//
//  Created by Darren Ford on 27/1/21.
//

import SwiftUI
import DSFSparkline

var LineSource1: DSFSparkline.DataSource = {
	let d = DSFSparkline.DataSource(windowSize: 20, range: 0 ... 1, zeroLineValue: 0.5)
	d.push(values: [
		0.72, 0.84, 0.15, 0.16, 0.30, 0.58, 0.87, 0.44, 0.02, 0.27,
		0.48, 0.16, 0.15, 0.14, 0.81, 0.53, 0.67, 0.52, 0.07, 0.50
	])
	return d
}()

let GraphColor = DSFColor.gray

struct LineDemoBasic: View {
	var body: some View {
		VStack {
			Text("Line")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					lineShading: false,
					shadowed: true
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					interpolated: true,
					lineShading: false
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoBasic_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoBasic()
	}
}

struct LineDemoBasicMarkers: View {
	var body: some View {
		VStack {
			Text("Line with markers")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					lineShading: false,
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					interpolated: true,
					lineShading: false,
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoBasicMarkers_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoBasicMarkers()
	}
}

struct LineDemoMarkersAndShadow: View {
	var body: some View {
		VStack {
			Text("Line with markers and shadow")
			DSFSparklineLineGraphView.SwiftUI(
				dataSource: LineSource1,
				graphColor: GraphColor,
				lineWidth: 1,
				lineShading: false,
				shadowed: true,
				markerSize: 4
			)
			.frame(height: 40.0)
			.padding(5)
			.border(Color.gray.opacity(0.2), width: 1)
		}
	}
}

struct LineDemoMarkersAndShadow_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoMarkersAndShadow()
	}
}

struct LineDemoBasicZeroLine: View {
	var body: some View {
		VStack {
			Text("Line with zero-line added")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					lineShading: false,
					showZeroLine: true
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineWidth: 1,
					interpolated: true,
					lineShading: false,
					showZeroLine: true
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoBasicZeroLine_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoBasicZeroLine()
	}
}

struct LineDemoArea: View {
	var body: some View {
		VStack {
			Text("Area")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					showZeroLine: true
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					interpolated: true,
					showZeroLine: true,
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoArea_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoArea()
	}
}


struct LineDemoAreaCentered: View {
	var body: some View {
		VStack {
			Text("Line centered")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					lineWidth: 0.5,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0)
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					interpolated: true,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0)
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoAreaCentered_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoAreaCentered()
	}
}

struct LineDemoAreaCenteredMarkers: View {
	var body: some View {
		VStack {
			Text("Line centered with markers")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					lineWidth: 0.5,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0),
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					interpolated: true,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0),
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoAreaCenteredMarkers_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoAreaCenteredMarkers()
	}
}


struct LineDemoAreaCenteredMarkersNoLowerColor: View {
	var body: some View {
		VStack {
			Text("Line centered with markers, single color")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					lineWidth: 0.5,
					showZeroLine: true,
					centeredAtZeroLine: true,
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
				
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: DSFColor.systemGreen,
					interpolated: true,
					showZeroLine: true,
					centeredAtZeroLine: true,
					markerSize: 4
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoAreaCenteredMarkersNoLowerColor_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoAreaCenteredMarkersNoLowerColor()
	}
}


struct LineDemoLineRanges: View {
	var body: some View {
		VStack {
			Text("Line with ranges")
			HStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					lineShading: false,
					highlightDefinitions: [
						DSFSparkline.HighlightRangeDefinition(
							range: 0.7 ..< 1.0,
							fillColor: DSFColor.red.withAlphaComponent(0.15).cgColor
						),
						DSFSparkline.HighlightRangeDefinition(
							range: 0.3 ..< 0.7,
							fillColor: DSFColor.yellow.withAlphaComponent(0.15).cgColor
						),
						DSFSparkline.HighlightRangeDefinition(
							range: 0.0 ..< 0.3,
							fillColor: DSFColor.green.withAlphaComponent(0.15).cgColor
						)
					]
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)

				DSFSparklineLineGraphView.SwiftUI(
					dataSource: LineSource1,
					graphColor: GraphColor,
					interpolated: true,
					lineShading: false,
					highlightDefinitions: [
						DSFSparkline.HighlightRangeDefinition(
							range: 0.4 ..< 0.6,
							fillColor: DSFColor.systemGray.withAlphaComponent(0.3).cgColor
						)
					]
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
			}
		}
	}
}

struct LineDemoLineRanges2_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoLineRanges2()
	}
}

struct LineDemoLineRanges2: View {

	let c0 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.736,  0.169, 0.264, 1.000])!
	let c1 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.927,  0.393, 0.265, 1.000])!
	let c2 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.945,  0.593, 0.257, 1.000])!
	let c3 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.950,  0.856, 0.373, 1.000])!
	let c4 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.605,  0.815, 0.249, 1.000])!
	let c5 = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [0.674,  0.938, 0.561, 1.000])!

	let source: DSFSparkline.DataSource = {
		let d = DSFSparkline.DataSource(windowSize: 12, range: 0 ... 50)
		d.push(values: [
			12, 12, 3, 16, 18, 22, 11, 26, 22, 45, 13, 10
		])
		return d
	}()

	var body: some View {
		HStack {
			DSFSparklineLineGraphView.SwiftUI(
				dataSource: source,
				graphColor: DSFColor.white,
				lineWidth: 4,
				interpolated: true,
				lineShading: false,
				shadowed: true,
				highlightDefinitions: [
					DSFSparkline.HighlightRangeDefinition(
						range: 0 ..< 5,
						fillColor: c0
					),
					DSFSparkline.HighlightRangeDefinition(
						range: 5 ..< 10,
						fillColor: c1
					),
					DSFSparkline.HighlightRangeDefinition(
						range: 10 ..< 15,
						fillColor: c2
					),
					DSFSparkline.HighlightRangeDefinition(
						range: 15 ..< 20,
						fillColor: c3
					),
					DSFSparkline.HighlightRangeDefinition(
						range: 20 ..< 25,
						fillColor: c4
					),
					DSFSparkline.HighlightRangeDefinition(
						range: 25 ..< 50,
						fillColor: c5
					),
				]
			)
			.frame(height: 120.0)
			.padding(5)
			.border(Color.gray.opacity(0.2), width: 1)
		}
	}
}

struct LineDemoCustomMarkers: View {

	let source: DSFSparkline.DataSource = {
		let d = DSFSparkline.DataSource(windowSize: 20, range: 0 ... 1, zeroLineValue: 0.5)
		d.push(values: [
			0.72, 0.84, 0.15, 0.16, 0.30, 0.58, 0.87, 0.44, 0.02, 0.27,
			0.48, 0.16, 0.15, 0.14, 0.81, 0.53, 0.67, 0.52, 0.07, 0.50
		])
		return d
	}()

	var drawCurrentValueMarker: DSFSparklineOverlay.Line.MarkerDrawingFunction = { context, markerFrames in
		let l = markerFrames.last!
		context.setFillColor(l.isPositiveValue ? DSFColor.systemGreen.cgColor : DSFColor.systemRed.cgColor)
		context.fill(l.rect)
	}

	var customMarkerDrawing: DSFSparklineOverlay.Line.MarkerDrawingFunction = { context, markerFrames in
		let maxV = markerFrames.min { (a, b) -> Bool in a.value > b.value }!
		let minV = markerFrames.min { (a, b) -> Bool in a.value < b.value }!

		// Min

		context.setFillColor(DSFColor.systemRed.cgColor)
		context.fill(minV.rect)

		context.setLineWidth(0.5)
		context.setStrokeColor(DSFColor.white.cgColor)
		context.stroke(minV.rect)

		// Max

		context.setFillColor(DSFColor.systemGreen.cgColor)
		context.fill(maxV.rect)

		context.setLineWidth(0.5)
		context.setStrokeColor(DSFColor.white.cgColor)
		context.stroke(maxV.rect)
	}

	var body: some View {
		HStack {
			VStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: source,
					graphColor: DSFColor.systemGreen,
					lineWidth: 0.5,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0),
					markerSize: 4,
					markerDrawingFunc: self.drawCurrentValueMarker
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
				Text("Current value marker").font(.footnote)
			}

			VStack {
				DSFSparklineLineGraphView.SwiftUI(
					dataSource: source,
					graphColor: DSFColor.systemGreen,
					lineWidth: 0.5,
					showZeroLine: true,
					centeredAtZeroLine: true,
					lowerGraphColor: DSFColor(red: 0.7, green: 0, blue: 0, alpha: 1.0),
					markerSize: 6,
					markerDrawingFunc: self.customMarkerDrawing
				)
				.frame(height: 40.0)
				.padding(5)
				.border(Color.gray.opacity(0.2), width: 1)
				Text("Min/Max marker").font(.footnote)
			}
		}
		.onAppear(perform: {
			startSomething()
		})
	}

	func startSomething() {
		if !IsRunningInPreviewPane {
			updateWithNewValues()
		}
	}

	func updateWithNewValues() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
			source.push(value: CGFloat.random(in: 0.0 ... 1.0))
			updateWithNewValues()
		}
	}
}

struct LineDemoCustomMarkers_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoCustomMarkers()
	}
}

struct LineDemoContentView: View {
	var body: some View {
		ScrollView([.vertical, .horizontal]) {
			VStack {
				VStack {
					LineDemoBasic()
					LineDemoBasicMarkers()
					LineDemoMarkersAndShadow()
					LineDemoBasicZeroLine()
					LineDemoArea()
				}
				VStack {
					LineDemoAreaCentered()
					LineDemoAreaCenteredMarkers()
					LineDemoAreaCenteredMarkersNoLowerColor()
					LineDemoLineRanges()
					LineDemoLineRanges2()
				}
				VStack {
					Text("Custom markers").font(.headline)
					LineDemoCustomMarkers()
				}
			}
			.frame(width: 400.0)
			.padding(10)
		}
	}
}


struct LineDemoContentView_Previews: PreviewProvider {
	static var previews: some View {
		LineDemoContentView()
	}
}
