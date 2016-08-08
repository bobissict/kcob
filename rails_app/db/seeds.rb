unless Industry.first
  Industry.create([
    { name: 'Finance' },
    { name: 'Real Estate' },
    { name: 'Digital' },
    { name: 'Sales' },
    { name: 'Agriculture' }
  ])
end
