// Code generated by Prisma (prisma@1.34.10). DO NOT EDIT.
  // Please don't change this file manually but run `prisma generate` to update it.
  // For more information, please read the docs: https://www.prisma.io/docs/prisma-client/

export const typeDefs = /* GraphQL */ `type Accomodation {
  id: ID!
  address: String!
  host: Profile
  phone_number: String!
}

type AccomodationConnection {
  pageInfo: PageInfo!
  edges: [AccomodationEdge]!
  aggregate: AggregateAccomodation!
}

input AccomodationCreateInput {
  id: ID
  address: String!
  host: ProfileCreateOneWithoutAccomodationInput
  phone_number: String!
}

input AccomodationCreateOneWithoutHostInput {
  create: AccomodationCreateWithoutHostInput
  connect: AccomodationWhereUniqueInput
}

input AccomodationCreateWithoutHostInput {
  id: ID
  address: String!
  phone_number: String!
}

type AccomodationEdge {
  node: Accomodation!
  cursor: String!
}

enum AccomodationOrderByInput {
  id_ASC
  id_DESC
  address_ASC
  address_DESC
  phone_number_ASC
  phone_number_DESC
}

type AccomodationPreviousValues {
  id: ID!
  address: String!
  phone_number: String!
}

type AccomodationSubscriptionPayload {
  mutation: MutationType!
  node: Accomodation
  updatedFields: [String!]
  previousValues: AccomodationPreviousValues
}

input AccomodationSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: AccomodationWhereInput
  AND: [AccomodationSubscriptionWhereInput!]
  OR: [AccomodationSubscriptionWhereInput!]
  NOT: [AccomodationSubscriptionWhereInput!]
}

input AccomodationUpdateInput {
  address: String
  host: ProfileUpdateOneWithoutAccomodationInput
  phone_number: String
}

input AccomodationUpdateManyMutationInput {
  address: String
  phone_number: String
}

input AccomodationUpdateOneWithoutHostInput {
  create: AccomodationCreateWithoutHostInput
  update: AccomodationUpdateWithoutHostDataInput
  upsert: AccomodationUpsertWithoutHostInput
  delete: Boolean
  disconnect: Boolean
  connect: AccomodationWhereUniqueInput
}

input AccomodationUpdateWithoutHostDataInput {
  address: String
  phone_number: String
}

input AccomodationUpsertWithoutHostInput {
  update: AccomodationUpdateWithoutHostDataInput!
  create: AccomodationCreateWithoutHostInput!
}

input AccomodationWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  address: String
  address_not: String
  address_in: [String!]
  address_not_in: [String!]
  address_lt: String
  address_lte: String
  address_gt: String
  address_gte: String
  address_contains: String
  address_not_contains: String
  address_starts_with: String
  address_not_starts_with: String
  address_ends_with: String
  address_not_ends_with: String
  host: ProfileWhereInput
  phone_number: String
  phone_number_not: String
  phone_number_in: [String!]
  phone_number_not_in: [String!]
  phone_number_lt: String
  phone_number_lte: String
  phone_number_gt: String
  phone_number_gte: String
  phone_number_contains: String
  phone_number_not_contains: String
  phone_number_starts_with: String
  phone_number_not_starts_with: String
  phone_number_ends_with: String
  phone_number_not_ends_with: String
  AND: [AccomodationWhereInput!]
  OR: [AccomodationWhereInput!]
  NOT: [AccomodationWhereInput!]
}

input AccomodationWhereUniqueInput {
  id: ID
  phone_number: String
}

type Activity {
  id: ID!
  name: String
  date_of_activity: DateTime
}

type ActivityConnection {
  pageInfo: PageInfo!
  edges: [ActivityEdge]!
  aggregate: AggregateActivity!
}

input ActivityCreateInput {
  id: ID
  name: String
  date_of_activity: DateTime
}

input ActivityCreateManyInput {
  create: [ActivityCreateInput!]
  connect: [ActivityWhereUniqueInput!]
}

type ActivityEdge {
  node: Activity!
  cursor: String!
}

enum ActivityOrderByInput {
  id_ASC
  id_DESC
  name_ASC
  name_DESC
  date_of_activity_ASC
  date_of_activity_DESC
}

type ActivityPreviousValues {
  id: ID!
  name: String
  date_of_activity: DateTime
}

input ActivityScalarWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  date_of_activity: DateTime
  date_of_activity_not: DateTime
  date_of_activity_in: [DateTime!]
  date_of_activity_not_in: [DateTime!]
  date_of_activity_lt: DateTime
  date_of_activity_lte: DateTime
  date_of_activity_gt: DateTime
  date_of_activity_gte: DateTime
  AND: [ActivityScalarWhereInput!]
  OR: [ActivityScalarWhereInput!]
  NOT: [ActivityScalarWhereInput!]
}

type ActivitySubscriptionPayload {
  mutation: MutationType!
  node: Activity
  updatedFields: [String!]
  previousValues: ActivityPreviousValues
}

input ActivitySubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: ActivityWhereInput
  AND: [ActivitySubscriptionWhereInput!]
  OR: [ActivitySubscriptionWhereInput!]
  NOT: [ActivitySubscriptionWhereInput!]
}

input ActivityUpdateDataInput {
  name: String
  date_of_activity: DateTime
}

input ActivityUpdateInput {
  name: String
  date_of_activity: DateTime
}

input ActivityUpdateManyDataInput {
  name: String
  date_of_activity: DateTime
}

input ActivityUpdateManyInput {
  create: [ActivityCreateInput!]
  update: [ActivityUpdateWithWhereUniqueNestedInput!]
  upsert: [ActivityUpsertWithWhereUniqueNestedInput!]
  delete: [ActivityWhereUniqueInput!]
  connect: [ActivityWhereUniqueInput!]
  set: [ActivityWhereUniqueInput!]
  disconnect: [ActivityWhereUniqueInput!]
  deleteMany: [ActivityScalarWhereInput!]
  updateMany: [ActivityUpdateManyWithWhereNestedInput!]
}

input ActivityUpdateManyMutationInput {
  name: String
  date_of_activity: DateTime
}

input ActivityUpdateManyWithWhereNestedInput {
  where: ActivityScalarWhereInput!
  data: ActivityUpdateManyDataInput!
}

input ActivityUpdateWithWhereUniqueNestedInput {
  where: ActivityWhereUniqueInput!
  data: ActivityUpdateDataInput!
}

input ActivityUpsertWithWhereUniqueNestedInput {
  where: ActivityWhereUniqueInput!
  update: ActivityUpdateDataInput!
  create: ActivityCreateInput!
}

input ActivityWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  date_of_activity: DateTime
  date_of_activity_not: DateTime
  date_of_activity_in: [DateTime!]
  date_of_activity_not_in: [DateTime!]
  date_of_activity_lt: DateTime
  date_of_activity_lte: DateTime
  date_of_activity_gt: DateTime
  date_of_activity_gte: DateTime
  AND: [ActivityWhereInput!]
  OR: [ActivityWhereInput!]
  NOT: [ActivityWhereInput!]
}

input ActivityWhereUniqueInput {
  id: ID
}

type AggregateAccomodation {
  count: Int!
}

type AggregateActivity {
  count: Int!
}

type AggregatePermission {
  count: Int!
}

type AggregateProfile {
  count: Int!
}

type AggregateRole {
  count: Int!
}

type AggregateUniversity {
  count: Int!
}

type AggregateUser {
  count: Int!
}

type BatchPayload {
  count: Long!
}

scalar DateTime

enum GenderType {
  MALE
  FEMALE
}

scalar Long

type Mutation {
  createAccomodation(data: AccomodationCreateInput!): Accomodation!
  updateAccomodation(data: AccomodationUpdateInput!, where: AccomodationWhereUniqueInput!): Accomodation
  updateManyAccomodations(data: AccomodationUpdateManyMutationInput!, where: AccomodationWhereInput): BatchPayload!
  upsertAccomodation(where: AccomodationWhereUniqueInput!, create: AccomodationCreateInput!, update: AccomodationUpdateInput!): Accomodation!
  deleteAccomodation(where: AccomodationWhereUniqueInput!): Accomodation
  deleteManyAccomodations(where: AccomodationWhereInput): BatchPayload!
  createActivity(data: ActivityCreateInput!): Activity!
  updateActivity(data: ActivityUpdateInput!, where: ActivityWhereUniqueInput!): Activity
  updateManyActivities(data: ActivityUpdateManyMutationInput!, where: ActivityWhereInput): BatchPayload!
  upsertActivity(where: ActivityWhereUniqueInput!, create: ActivityCreateInput!, update: ActivityUpdateInput!): Activity!
  deleteActivity(where: ActivityWhereUniqueInput!): Activity
  deleteManyActivities(where: ActivityWhereInput): BatchPayload!
  createPermission(data: PermissionCreateInput!): Permission!
  updatePermission(data: PermissionUpdateInput!, where: PermissionWhereUniqueInput!): Permission
  updateManyPermissions(data: PermissionUpdateManyMutationInput!, where: PermissionWhereInput): BatchPayload!
  upsertPermission(where: PermissionWhereUniqueInput!, create: PermissionCreateInput!, update: PermissionUpdateInput!): Permission!
  deletePermission(where: PermissionWhereUniqueInput!): Permission
  deleteManyPermissions(where: PermissionWhereInput): BatchPayload!
  createProfile(data: ProfileCreateInput!): Profile!
  updateProfile(data: ProfileUpdateInput!, where: ProfileWhereUniqueInput!): Profile
  updateManyProfiles(data: ProfileUpdateManyMutationInput!, where: ProfileWhereInput): BatchPayload!
  upsertProfile(where: ProfileWhereUniqueInput!, create: ProfileCreateInput!, update: ProfileUpdateInput!): Profile!
  deleteProfile(where: ProfileWhereUniqueInput!): Profile
  deleteManyProfiles(where: ProfileWhereInput): BatchPayload!
  createRole(data: RoleCreateInput!): Role!
  updateRole(data: RoleUpdateInput!, where: RoleWhereUniqueInput!): Role
  updateManyRoles(data: RoleUpdateManyMutationInput!, where: RoleWhereInput): BatchPayload!
  upsertRole(where: RoleWhereUniqueInput!, create: RoleCreateInput!, update: RoleUpdateInput!): Role!
  deleteRole(where: RoleWhereUniqueInput!): Role
  deleteManyRoles(where: RoleWhereInput): BatchPayload!
  createUniversity(data: UniversityCreateInput!): University!
  updateUniversity(data: UniversityUpdateInput!, where: UniversityWhereUniqueInput!): University
  updateManyUniversities(data: UniversityUpdateManyMutationInput!, where: UniversityWhereInput): BatchPayload!
  upsertUniversity(where: UniversityWhereUniqueInput!, create: UniversityCreateInput!, update: UniversityUpdateInput!): University!
  deleteUniversity(where: UniversityWhereUniqueInput!): University
  deleteManyUniversities(where: UniversityWhereInput): BatchPayload!
  createUser(data: UserCreateInput!): User!
  updateUser(data: UserUpdateInput!, where: UserWhereUniqueInput!): User
  updateManyUsers(data: UserUpdateManyMutationInput!, where: UserWhereInput): BatchPayload!
  upsertUser(where: UserWhereUniqueInput!, create: UserCreateInput!, update: UserUpdateInput!): User!
  deleteUser(where: UserWhereUniqueInput!): User
  deleteManyUsers(where: UserWhereInput): BatchPayload!
}

enum MutationType {
  CREATED
  UPDATED
  DELETED
}

interface Node {
  id: ID!
}

type PageInfo {
  hasNextPage: Boolean!
  hasPreviousPage: Boolean!
  startCursor: String
  endCursor: String
}

type Permission {
  id: ID!
  role: User
  action: String
  resources: String
  domain: String
}

type PermissionConnection {
  pageInfo: PageInfo!
  edges: [PermissionEdge]!
  aggregate: AggregatePermission!
}

input PermissionCreateInput {
  id: ID
  role: UserCreateOneInput
  action: String
  resources: String
  domain: String
}

input PermissionCreateManyInput {
  create: [PermissionCreateInput!]
  connect: [PermissionWhereUniqueInput!]
}

type PermissionEdge {
  node: Permission!
  cursor: String!
}

enum PermissionOrderByInput {
  id_ASC
  id_DESC
  action_ASC
  action_DESC
  resources_ASC
  resources_DESC
  domain_ASC
  domain_DESC
}

type PermissionPreviousValues {
  id: ID!
  action: String
  resources: String
  domain: String
}

input PermissionScalarWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  action: String
  action_not: String
  action_in: [String!]
  action_not_in: [String!]
  action_lt: String
  action_lte: String
  action_gt: String
  action_gte: String
  action_contains: String
  action_not_contains: String
  action_starts_with: String
  action_not_starts_with: String
  action_ends_with: String
  action_not_ends_with: String
  resources: String
  resources_not: String
  resources_in: [String!]
  resources_not_in: [String!]
  resources_lt: String
  resources_lte: String
  resources_gt: String
  resources_gte: String
  resources_contains: String
  resources_not_contains: String
  resources_starts_with: String
  resources_not_starts_with: String
  resources_ends_with: String
  resources_not_ends_with: String
  domain: String
  domain_not: String
  domain_in: [String!]
  domain_not_in: [String!]
  domain_lt: String
  domain_lte: String
  domain_gt: String
  domain_gte: String
  domain_contains: String
  domain_not_contains: String
  domain_starts_with: String
  domain_not_starts_with: String
  domain_ends_with: String
  domain_not_ends_with: String
  AND: [PermissionScalarWhereInput!]
  OR: [PermissionScalarWhereInput!]
  NOT: [PermissionScalarWhereInput!]
}

type PermissionSubscriptionPayload {
  mutation: MutationType!
  node: Permission
  updatedFields: [String!]
  previousValues: PermissionPreviousValues
}

input PermissionSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: PermissionWhereInput
  AND: [PermissionSubscriptionWhereInput!]
  OR: [PermissionSubscriptionWhereInput!]
  NOT: [PermissionSubscriptionWhereInput!]
}

input PermissionUpdateDataInput {
  role: UserUpdateOneInput
  action: String
  resources: String
  domain: String
}

input PermissionUpdateInput {
  role: UserUpdateOneInput
  action: String
  resources: String
  domain: String
}

input PermissionUpdateManyDataInput {
  action: String
  resources: String
  domain: String
}

input PermissionUpdateManyInput {
  create: [PermissionCreateInput!]
  update: [PermissionUpdateWithWhereUniqueNestedInput!]
  upsert: [PermissionUpsertWithWhereUniqueNestedInput!]
  delete: [PermissionWhereUniqueInput!]
  connect: [PermissionWhereUniqueInput!]
  set: [PermissionWhereUniqueInput!]
  disconnect: [PermissionWhereUniqueInput!]
  deleteMany: [PermissionScalarWhereInput!]
  updateMany: [PermissionUpdateManyWithWhereNestedInput!]
}

input PermissionUpdateManyMutationInput {
  action: String
  resources: String
  domain: String
}

input PermissionUpdateManyWithWhereNestedInput {
  where: PermissionScalarWhereInput!
  data: PermissionUpdateManyDataInput!
}

input PermissionUpdateWithWhereUniqueNestedInput {
  where: PermissionWhereUniqueInput!
  data: PermissionUpdateDataInput!
}

input PermissionUpsertWithWhereUniqueNestedInput {
  where: PermissionWhereUniqueInput!
  update: PermissionUpdateDataInput!
  create: PermissionCreateInput!
}

input PermissionWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  role: UserWhereInput
  action: String
  action_not: String
  action_in: [String!]
  action_not_in: [String!]
  action_lt: String
  action_lte: String
  action_gt: String
  action_gte: String
  action_contains: String
  action_not_contains: String
  action_starts_with: String
  action_not_starts_with: String
  action_ends_with: String
  action_not_ends_with: String
  resources: String
  resources_not: String
  resources_in: [String!]
  resources_not_in: [String!]
  resources_lt: String
  resources_lte: String
  resources_gt: String
  resources_gte: String
  resources_contains: String
  resources_not_contains: String
  resources_starts_with: String
  resources_not_starts_with: String
  resources_ends_with: String
  resources_not_ends_with: String
  domain: String
  domain_not: String
  domain_in: [String!]
  domain_not_in: [String!]
  domain_lt: String
  domain_lte: String
  domain_gt: String
  domain_gte: String
  domain_contains: String
  domain_not_contains: String
  domain_starts_with: String
  domain_not_starts_with: String
  domain_ends_with: String
  domain_not_ends_with: String
  AND: [PermissionWhereInput!]
  OR: [PermissionWhereInput!]
  NOT: [PermissionWhereInput!]
}

input PermissionWhereUniqueInput {
  id: ID
}

type Profile {
  id: ID!
  first_name: String!
  last_name: String!
  university: University!
  phone_number: String!
  badge_number: String!
  gender: GenderType!
  food_allergies: String!
  height: Float
  weight: Float
  shoe_size: String
  activity(where: ActivityWhereInput, orderBy: ActivityOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Activity!]
  accomodation: Accomodation
}

type ProfileConnection {
  pageInfo: PageInfo!
  edges: [ProfileEdge]!
  aggregate: AggregateProfile!
}

input ProfileCreateInput {
  id: ID
  first_name: String!
  last_name: String!
  university: UniversityCreateOneWithoutContact_personInput!
  phone_number: String!
  badge_number: String!
  gender: GenderType!
  food_allergies: String!
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityCreateManyInput
  accomodation: AccomodationCreateOneWithoutHostInput
}

input ProfileCreateOneInput {
  create: ProfileCreateInput
  connect: ProfileWhereUniqueInput
}

input ProfileCreateOneWithoutAccomodationInput {
  create: ProfileCreateWithoutAccomodationInput
  connect: ProfileWhereUniqueInput
}

input ProfileCreateOneWithoutUniversityInput {
  create: ProfileCreateWithoutUniversityInput
  connect: ProfileWhereUniqueInput
}

input ProfileCreateWithoutAccomodationInput {
  id: ID
  first_name: String!
  last_name: String!
  university: UniversityCreateOneWithoutContact_personInput!
  phone_number: String!
  badge_number: String!
  gender: GenderType!
  food_allergies: String!
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityCreateManyInput
}

input ProfileCreateWithoutUniversityInput {
  id: ID
  first_name: String!
  last_name: String!
  phone_number: String!
  badge_number: String!
  gender: GenderType!
  food_allergies: String!
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityCreateManyInput
  accomodation: AccomodationCreateOneWithoutHostInput
}

type ProfileEdge {
  node: Profile!
  cursor: String!
}

enum ProfileOrderByInput {
  id_ASC
  id_DESC
  first_name_ASC
  first_name_DESC
  last_name_ASC
  last_name_DESC
  phone_number_ASC
  phone_number_DESC
  badge_number_ASC
  badge_number_DESC
  gender_ASC
  gender_DESC
  food_allergies_ASC
  food_allergies_DESC
  height_ASC
  height_DESC
  weight_ASC
  weight_DESC
  shoe_size_ASC
  shoe_size_DESC
}

type ProfilePreviousValues {
  id: ID!
  first_name: String!
  last_name: String!
  phone_number: String!
  badge_number: String!
  gender: GenderType!
  food_allergies: String!
  height: Float
  weight: Float
  shoe_size: String
}

type ProfileSubscriptionPayload {
  mutation: MutationType!
  node: Profile
  updatedFields: [String!]
  previousValues: ProfilePreviousValues
}

input ProfileSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: ProfileWhereInput
  AND: [ProfileSubscriptionWhereInput!]
  OR: [ProfileSubscriptionWhereInput!]
  NOT: [ProfileSubscriptionWhereInput!]
}

input ProfileUpdateDataInput {
  first_name: String
  last_name: String
  university: UniversityUpdateOneRequiredWithoutContact_personInput
  phone_number: String
  badge_number: String
  gender: GenderType
  food_allergies: String
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityUpdateManyInput
  accomodation: AccomodationUpdateOneWithoutHostInput
}

input ProfileUpdateInput {
  first_name: String
  last_name: String
  university: UniversityUpdateOneRequiredWithoutContact_personInput
  phone_number: String
  badge_number: String
  gender: GenderType
  food_allergies: String
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityUpdateManyInput
  accomodation: AccomodationUpdateOneWithoutHostInput
}

input ProfileUpdateManyMutationInput {
  first_name: String
  last_name: String
  phone_number: String
  badge_number: String
  gender: GenderType
  food_allergies: String
  height: Float
  weight: Float
  shoe_size: String
}

input ProfileUpdateOneInput {
  create: ProfileCreateInput
  update: ProfileUpdateDataInput
  upsert: ProfileUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: ProfileWhereUniqueInput
}

input ProfileUpdateOneWithoutAccomodationInput {
  create: ProfileCreateWithoutAccomodationInput
  update: ProfileUpdateWithoutAccomodationDataInput
  upsert: ProfileUpsertWithoutAccomodationInput
  delete: Boolean
  disconnect: Boolean
  connect: ProfileWhereUniqueInput
}

input ProfileUpdateOneWithoutUniversityInput {
  create: ProfileCreateWithoutUniversityInput
  update: ProfileUpdateWithoutUniversityDataInput
  upsert: ProfileUpsertWithoutUniversityInput
  delete: Boolean
  disconnect: Boolean
  connect: ProfileWhereUniqueInput
}

input ProfileUpdateWithoutAccomodationDataInput {
  first_name: String
  last_name: String
  university: UniversityUpdateOneRequiredWithoutContact_personInput
  phone_number: String
  badge_number: String
  gender: GenderType
  food_allergies: String
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityUpdateManyInput
}

input ProfileUpdateWithoutUniversityDataInput {
  first_name: String
  last_name: String
  phone_number: String
  badge_number: String
  gender: GenderType
  food_allergies: String
  height: Float
  weight: Float
  shoe_size: String
  activity: ActivityUpdateManyInput
  accomodation: AccomodationUpdateOneWithoutHostInput
}

input ProfileUpsertNestedInput {
  update: ProfileUpdateDataInput!
  create: ProfileCreateInput!
}

input ProfileUpsertWithoutAccomodationInput {
  update: ProfileUpdateWithoutAccomodationDataInput!
  create: ProfileCreateWithoutAccomodationInput!
}

input ProfileUpsertWithoutUniversityInput {
  update: ProfileUpdateWithoutUniversityDataInput!
  create: ProfileCreateWithoutUniversityInput!
}

input ProfileWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  first_name: String
  first_name_not: String
  first_name_in: [String!]
  first_name_not_in: [String!]
  first_name_lt: String
  first_name_lte: String
  first_name_gt: String
  first_name_gte: String
  first_name_contains: String
  first_name_not_contains: String
  first_name_starts_with: String
  first_name_not_starts_with: String
  first_name_ends_with: String
  first_name_not_ends_with: String
  last_name: String
  last_name_not: String
  last_name_in: [String!]
  last_name_not_in: [String!]
  last_name_lt: String
  last_name_lte: String
  last_name_gt: String
  last_name_gte: String
  last_name_contains: String
  last_name_not_contains: String
  last_name_starts_with: String
  last_name_not_starts_with: String
  last_name_ends_with: String
  last_name_not_ends_with: String
  university: UniversityWhereInput
  phone_number: String
  phone_number_not: String
  phone_number_in: [String!]
  phone_number_not_in: [String!]
  phone_number_lt: String
  phone_number_lte: String
  phone_number_gt: String
  phone_number_gte: String
  phone_number_contains: String
  phone_number_not_contains: String
  phone_number_starts_with: String
  phone_number_not_starts_with: String
  phone_number_ends_with: String
  phone_number_not_ends_with: String
  badge_number: String
  badge_number_not: String
  badge_number_in: [String!]
  badge_number_not_in: [String!]
  badge_number_lt: String
  badge_number_lte: String
  badge_number_gt: String
  badge_number_gte: String
  badge_number_contains: String
  badge_number_not_contains: String
  badge_number_starts_with: String
  badge_number_not_starts_with: String
  badge_number_ends_with: String
  badge_number_not_ends_with: String
  gender: GenderType
  gender_not: GenderType
  gender_in: [GenderType!]
  gender_not_in: [GenderType!]
  food_allergies: String
  food_allergies_not: String
  food_allergies_in: [String!]
  food_allergies_not_in: [String!]
  food_allergies_lt: String
  food_allergies_lte: String
  food_allergies_gt: String
  food_allergies_gte: String
  food_allergies_contains: String
  food_allergies_not_contains: String
  food_allergies_starts_with: String
  food_allergies_not_starts_with: String
  food_allergies_ends_with: String
  food_allergies_not_ends_with: String
  height: Float
  height_not: Float
  height_in: [Float!]
  height_not_in: [Float!]
  height_lt: Float
  height_lte: Float
  height_gt: Float
  height_gte: Float
  weight: Float
  weight_not: Float
  weight_in: [Float!]
  weight_not_in: [Float!]
  weight_lt: Float
  weight_lte: Float
  weight_gt: Float
  weight_gte: Float
  shoe_size: String
  shoe_size_not: String
  shoe_size_in: [String!]
  shoe_size_not_in: [String!]
  shoe_size_lt: String
  shoe_size_lte: String
  shoe_size_gt: String
  shoe_size_gte: String
  shoe_size_contains: String
  shoe_size_not_contains: String
  shoe_size_starts_with: String
  shoe_size_not_starts_with: String
  shoe_size_ends_with: String
  shoe_size_not_ends_with: String
  activity_every: ActivityWhereInput
  activity_some: ActivityWhereInput
  activity_none: ActivityWhereInput
  accomodation: AccomodationWhereInput
  AND: [ProfileWhereInput!]
  OR: [ProfileWhereInput!]
  NOT: [ProfileWhereInput!]
}

input ProfileWhereUniqueInput {
  id: ID
  phone_number: String
}

type Query {
  accomodation(where: AccomodationWhereUniqueInput!): Accomodation
  accomodations(where: AccomodationWhereInput, orderBy: AccomodationOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Accomodation]!
  accomodationsConnection(where: AccomodationWhereInput, orderBy: AccomodationOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): AccomodationConnection!
  activity(where: ActivityWhereUniqueInput!): Activity
  activities(where: ActivityWhereInput, orderBy: ActivityOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Activity]!
  activitiesConnection(where: ActivityWhereInput, orderBy: ActivityOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): ActivityConnection!
  permission(where: PermissionWhereUniqueInput!): Permission
  permissions(where: PermissionWhereInput, orderBy: PermissionOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Permission]!
  permissionsConnection(where: PermissionWhereInput, orderBy: PermissionOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): PermissionConnection!
  profile(where: ProfileWhereUniqueInput!): Profile
  profiles(where: ProfileWhereInput, orderBy: ProfileOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Profile]!
  profilesConnection(where: ProfileWhereInput, orderBy: ProfileOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): ProfileConnection!
  role(where: RoleWhereUniqueInput!): Role
  roles(where: RoleWhereInput, orderBy: RoleOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Role]!
  rolesConnection(where: RoleWhereInput, orderBy: RoleOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): RoleConnection!
  university(where: UniversityWhereUniqueInput!): University
  universities(where: UniversityWhereInput, orderBy: UniversityOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [University]!
  universitiesConnection(where: UniversityWhereInput, orderBy: UniversityOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): UniversityConnection!
  user(where: UserWhereUniqueInput!): User
  users(where: UserWhereInput, orderBy: UserOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [User]!
  usersConnection(where: UserWhereInput, orderBy: UserOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): UserConnection!
  node(id: ID!): Node
}

type Role {
  id: ID!
  name: String
  permission(where: PermissionWhereInput, orderBy: PermissionOrderByInput, skip: Int, after: String, before: String, first: Int, last: Int): [Permission!]
}

type RoleConnection {
  pageInfo: PageInfo!
  edges: [RoleEdge]!
  aggregate: AggregateRole!
}

input RoleCreateInput {
  id: ID
  name: String
  permission: PermissionCreateManyInput
}

type RoleEdge {
  node: Role!
  cursor: String!
}

enum RoleOrderByInput {
  id_ASC
  id_DESC
  name_ASC
  name_DESC
}

type RolePreviousValues {
  id: ID!
  name: String
}

type RoleSubscriptionPayload {
  mutation: MutationType!
  node: Role
  updatedFields: [String!]
  previousValues: RolePreviousValues
}

input RoleSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: RoleWhereInput
  AND: [RoleSubscriptionWhereInput!]
  OR: [RoleSubscriptionWhereInput!]
  NOT: [RoleSubscriptionWhereInput!]
}

input RoleUpdateInput {
  name: String
  permission: PermissionUpdateManyInput
}

input RoleUpdateManyMutationInput {
  name: String
}

input RoleWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  permission_every: PermissionWhereInput
  permission_some: PermissionWhereInput
  permission_none: PermissionWhereInput
  AND: [RoleWhereInput!]
  OR: [RoleWhereInput!]
  NOT: [RoleWhereInput!]
}

input RoleWhereUniqueInput {
  id: ID
}

type Subscription {
  accomodation(where: AccomodationSubscriptionWhereInput): AccomodationSubscriptionPayload
  activity(where: ActivitySubscriptionWhereInput): ActivitySubscriptionPayload
  permission(where: PermissionSubscriptionWhereInput): PermissionSubscriptionPayload
  profile(where: ProfileSubscriptionWhereInput): ProfileSubscriptionPayload
  role(where: RoleSubscriptionWhereInput): RoleSubscriptionPayload
  university(where: UniversitySubscriptionWhereInput): UniversitySubscriptionPayload
  user(where: UserSubscriptionWhereInput): UserSubscriptionPayload
}

type University {
  id: ID!
  contact_person: Profile
  address: String
  name: String!
}

type UniversityConnection {
  pageInfo: PageInfo!
  edges: [UniversityEdge]!
  aggregate: AggregateUniversity!
}

input UniversityCreateInput {
  id: ID
  contact_person: ProfileCreateOneWithoutUniversityInput
  address: String
  name: String!
}

input UniversityCreateOneWithoutContact_personInput {
  create: UniversityCreateWithoutContact_personInput
  connect: UniversityWhereUniqueInput
}

input UniversityCreateWithoutContact_personInput {
  id: ID
  address: String
  name: String!
}

type UniversityEdge {
  node: University!
  cursor: String!
}

enum UniversityOrderByInput {
  id_ASC
  id_DESC
  address_ASC
  address_DESC
  name_ASC
  name_DESC
}

type UniversityPreviousValues {
  id: ID!
  address: String
  name: String!
}

type UniversitySubscriptionPayload {
  mutation: MutationType!
  node: University
  updatedFields: [String!]
  previousValues: UniversityPreviousValues
}

input UniversitySubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: UniversityWhereInput
  AND: [UniversitySubscriptionWhereInput!]
  OR: [UniversitySubscriptionWhereInput!]
  NOT: [UniversitySubscriptionWhereInput!]
}

input UniversityUpdateInput {
  contact_person: ProfileUpdateOneWithoutUniversityInput
  address: String
  name: String
}

input UniversityUpdateManyMutationInput {
  address: String
  name: String
}

input UniversityUpdateOneRequiredWithoutContact_personInput {
  create: UniversityCreateWithoutContact_personInput
  update: UniversityUpdateWithoutContact_personDataInput
  upsert: UniversityUpsertWithoutContact_personInput
  connect: UniversityWhereUniqueInput
}

input UniversityUpdateWithoutContact_personDataInput {
  address: String
  name: String
}

input UniversityUpsertWithoutContact_personInput {
  update: UniversityUpdateWithoutContact_personDataInput!
  create: UniversityCreateWithoutContact_personInput!
}

input UniversityWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  contact_person: ProfileWhereInput
  address: String
  address_not: String
  address_in: [String!]
  address_not_in: [String!]
  address_lt: String
  address_lte: String
  address_gt: String
  address_gte: String
  address_contains: String
  address_not_contains: String
  address_starts_with: String
  address_not_starts_with: String
  address_ends_with: String
  address_not_ends_with: String
  name: String
  name_not: String
  name_in: [String!]
  name_not_in: [String!]
  name_lt: String
  name_lte: String
  name_gt: String
  name_gte: String
  name_contains: String
  name_not_contains: String
  name_starts_with: String
  name_not_starts_with: String
  name_ends_with: String
  name_not_ends_with: String
  AND: [UniversityWhereInput!]
  OR: [UniversityWhereInput!]
  NOT: [UniversityWhereInput!]
}

input UniversityWhereUniqueInput {
  id: ID
}

type User {
  id: ID!
  profile: Profile
  email: String!
  password: String!
}

type UserConnection {
  pageInfo: PageInfo!
  edges: [UserEdge]!
  aggregate: AggregateUser!
}

input UserCreateInput {
  id: ID
  profile: ProfileCreateOneInput
  email: String!
  password: String!
}

input UserCreateOneInput {
  create: UserCreateInput
  connect: UserWhereUniqueInput
}

type UserEdge {
  node: User!
  cursor: String!
}

enum UserOrderByInput {
  id_ASC
  id_DESC
  email_ASC
  email_DESC
  password_ASC
  password_DESC
}

type UserPreviousValues {
  id: ID!
  email: String!
  password: String!
}

type UserSubscriptionPayload {
  mutation: MutationType!
  node: User
  updatedFields: [String!]
  previousValues: UserPreviousValues
}

input UserSubscriptionWhereInput {
  mutation_in: [MutationType!]
  updatedFields_contains: String
  updatedFields_contains_every: [String!]
  updatedFields_contains_some: [String!]
  node: UserWhereInput
  AND: [UserSubscriptionWhereInput!]
  OR: [UserSubscriptionWhereInput!]
  NOT: [UserSubscriptionWhereInput!]
}

input UserUpdateDataInput {
  profile: ProfileUpdateOneInput
  email: String
  password: String
}

input UserUpdateInput {
  profile: ProfileUpdateOneInput
  email: String
  password: String
}

input UserUpdateManyMutationInput {
  email: String
  password: String
}

input UserUpdateOneInput {
  create: UserCreateInput
  update: UserUpdateDataInput
  upsert: UserUpsertNestedInput
  delete: Boolean
  disconnect: Boolean
  connect: UserWhereUniqueInput
}

input UserUpsertNestedInput {
  update: UserUpdateDataInput!
  create: UserCreateInput!
}

input UserWhereInput {
  id: ID
  id_not: ID
  id_in: [ID!]
  id_not_in: [ID!]
  id_lt: ID
  id_lte: ID
  id_gt: ID
  id_gte: ID
  id_contains: ID
  id_not_contains: ID
  id_starts_with: ID
  id_not_starts_with: ID
  id_ends_with: ID
  id_not_ends_with: ID
  profile: ProfileWhereInput
  email: String
  email_not: String
  email_in: [String!]
  email_not_in: [String!]
  email_lt: String
  email_lte: String
  email_gt: String
  email_gte: String
  email_contains: String
  email_not_contains: String
  email_starts_with: String
  email_not_starts_with: String
  email_ends_with: String
  email_not_ends_with: String
  password: String
  password_not: String
  password_in: [String!]
  password_not_in: [String!]
  password_lt: String
  password_lte: String
  password_gt: String
  password_gte: String
  password_contains: String
  password_not_contains: String
  password_starts_with: String
  password_not_starts_with: String
  password_ends_with: String
  password_not_ends_with: String
  AND: [UserWhereInput!]
  OR: [UserWhereInput!]
  NOT: [UserWhereInput!]
}

input UserWhereUniqueInput {
  id: ID
  email: String
}
`