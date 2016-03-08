# freshbooks-time-to-harvest

This simple app will read time entries from FreshBooks and push them to Harvest. It is configured via some environment variables as well as a mapping file.

## Configuration env variables

It is recommended to put these in a `docker.env` file:

```sh
HARVEST_SUBDOMAIN
HARVEST_USERNAME
HARVEST_PASSWORD
FRESHBOOKS_SUBDOMAIN
FRESHBOOKS_API_KEY
```

## Mapping file

The mapping file is ruby, using a simple DSL. It must be created at `mapping.rb`, and each line looks like this:

```ruby
map from: { staff_id: 1234, project_id: 234, task_id: 3456 },
    to: { project_id: 4567, task_id: 2589 },
    name: 'Ops'
```

- `from` is a set of properties to filter/match FreshBooks time entries
- `to` is a set of properties to set find and/or create new Harvest time entries
- `name` is just a comment

## Usage

Once configured, invoke the tool like this:

```sh
docker-compose run main START-DATE
```

Where `START-DATE` is the earliest date you wish perform the operation.
