//
//  ScheduleView.swift
//  HockeyInfoDatabase
//
//  Created by Larry Burris on 1/15/22.
//
import SwiftUI

struct ScheduleView: View
{
    @State var dateValue = Date()
    
    var seasonScheduleViewModel = SeasonScheduleViewModel()
    
    var body: some View
    {
        //  The selectedValue property fixes a bug where the selected value of the date picker is not updated with tap gesture
        let selectedValue = Binding<Date>(
            
            get:
            {
                dateValue
            },
            set:
            {
                dateValue = $0

                //  Set the selected value in the view model to automatically update the published filtered list of scheduled games
                seasonScheduleViewModel.selectedDate = formatDate(dateValue)
                
                print("Selected date assigned to view model is \(seasonScheduleViewModel.selectedDate)")
            }
        )
        
        NavigationView
        {
            VStack(alignment: .leading, spacing: 0)
            {
                ZStack
                {
                    DatePicker("Choose a date:",
                            selection: selectedValue,
                            displayedComponents: .date)
                            .datePickerStyle(.graphical)
                    
                    if seasonScheduleViewModel.isLoading
                    {
                        ProgressView()
                    }
                }
                
                Text("Scheduled games for \(formatDate(dateValue))")
                    .font(.subheadline).bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                                
                ScrollView(showsIndicators: false)
                {
                    ForEach(SeasonScheduleViewModel.sampleGames(), id: \.self)
                    {
                        game in
                        
                        HStack(spacing: 5)
                        {
                            Text("\(game.time)").font(.caption).bold().padding(.leading)
                            Text("|").font(.largeTitle)
                            
                            VStack(alignment: .leading)
                            {
                                Text("\(game.awayTeam) @ \(game.homeTeam)")
                                Text("\(game.venue)")
                            }
                            .font(.caption)
                            
                            Spacer()
                        }
                    }
                }
                .listStyle(.plain)
                
                Spacer()
            }
            .navigationTitle("Season Schedule")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                Button("Today")
                {
                    dateValue = Date()
                    selectedValue.wrappedValue = Date()
                }
            }
        }
    }
}

struct ScheduleView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ScheduleView()
    }
}

func formatDate(_ date: Date) -> String
{
    let formatter = DateFormatter()

    formatter.dateFormat = "EEEE, MMM d, yyyy"

    return formatter.string(from: date)
}


