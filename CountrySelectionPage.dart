import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountrySelectionPage extends StatefulWidget {
  const CountrySelectionPage({super.key});

  @override
  State<CountrySelectionPage> createState() => _CountrySelectionPageState();
}

class _CountrySelectionPageState extends State<CountrySelectionPage> {
  late List<Country> allCountries;
  late List<Country> filteredCountries;
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    allCountries = CountryService().getAll();
    allCountries.sort((a, b) => a.name.compareTo(b.name));
    filteredCountries = List.from(allCountries);
  }

  void updateSearchQuery(String query) {
    setState(() {
      filteredCountries =
          allCountries.where((country) {
            return country.name.toLowerCase().contains(query.toLowerCase());
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 241, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 241, 255),
        elevation: 0,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "Select Your Country",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "Search country...",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                  onChanged: updateSearchQuery,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredCountries.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    bool isSelected =
                        selectedCountry?.countryCode == country.countryCode;
                    return ListTile(
                      leading: Text(
                        country.flagEmoji,
                        style: const TextStyle(fontSize: 40),
                      ),
                      title: Text(
                        country.name,
                        style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color:
                            isSelected
                                ? const Color.fromARGB(255, 141, 188, 242)
                                : Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedCountry = null;
                          } else {
                            selectedCountry = country;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      selectedCountry != null
                          ? () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Saved: ${selectedCountry!.name}',
                                ),
                              ),
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 115, 169, 251),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    "SAVE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
