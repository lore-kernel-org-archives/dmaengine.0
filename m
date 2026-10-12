Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B842279DCC;
	Mon, 12 Oct 2026 15:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817855; cv=fail; b=RHzhATBe9QxUx2l6qNLOLUbT8Joy9aZ0dn0/TClqWjLwktHJYrg1fWBOhxRO+P986cHaj11DJWRjiHX/9Ed4jjoIGjngY6HUgIPKrKGPp6THmAcNoXvIo+cO2LEKdwuWFipdXEiHNXnPKjn1NXNltuGrhsjNZWT07nNTw+Rbreo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817855; c=relaxed/simple;
	bh=T7giXeldWN1KauqdqkTZNr3N7Krbc8708IjqGc5ZrNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=POtErDIQ+f3rxxO2ejGKLvU9thZecZS9xn2e57jnVpwRpCY36mTX2PMqK0haq+i83S1fSs9vIjBlUSO7Zp2gY1OwNN/0i1+rnuZ9ZxTrk7sKzdQMYO0Lz8ssEsfNxKVTU1iR+7GqQz8dgv3UmDeot9J97cVAs7uiV8nZDlntnQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fjy9xjwF; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fjy9xjwF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbjgdfmZjMwt3YlGsuGNsTYxL2LyI7psJBZtbWDX8gy839OwfmENdTCE0hXs0rOOUlPoHAL0I3F4kFBYxaEaaoumoOjxodQYK2tWM1LLObv+uMn5ko8wLxbyNxRcFHFEDZ7LkoQeDd4kK78fHpiPzKDNcp/UC5l4aSV4hLdcWWk9eneGlfztp5Gi6rYUBwFyz/yvsKzPRwIMKDerTS/YwvXZLyS3DU2hIc9lGUY4wO+HQLKRtfOfWCEEW6IOz0oKPySWRSfFDIrL6IJSFN2gzfuyznqRSIz6UGyG6Cf/0vBgGhn3/uMIdbiP77vn2HcLx+gwlWCQq3jtl524FLNP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7giXeldWN1KauqdqkTZNr3N7Krbc8708IjqGc5ZrNI=;
 b=MfA8NIem3ivOKazcQRPVfZl7ly+v2CwgfgmR9Slr3FAskMGB9JDp2yCjmfaY0hMsJDn5VKj2XLdo9dfrToiUGruPhy551NBk/lShb6Ucx4ZhiyAYmXzq/H/KdM7hJaPSZ0AxjphPYCPYb8gvJov/lbSoneUIqtsZNvh0gD+OLJWeu887LH6+cURfTRBlh7ZDVuRu9Ni3S4xTwu5HHFCpvfGjukvG8RLRiPsajhcS2dUWsMNJopgPaYKZwNDUnQvnvdfg0Op1GMOKCklnd3fNSPCHLsfPuQjFjvMuQMDT3VXfZnNnbwiosEZC9cNUQDtVA2iMstRnAHLD49AOVAv71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7giXeldWN1KauqdqkTZNr3N7Krbc8708IjqGc5ZrNI=;
 b=fjy9xjwFDXxxsAI+Yw1PycGStlr8Z2lCIQEABN9Pe8vQWtTV3rkx4vrCw1/ulbCjNQB5hy+VVLMVFDg9//iXwF80fnDk3wNxjggygzoFvBNnKL4xnUNpW3wBlP3t70ZqX6v+mcH6pDQHINhFcNv8Bh1Nx3MEHKDoZfIHvaPxPPibtyeIRytGG2xttQT6XkRYIvFOo2jAVZrb1WpeB3aXh+4RtKkOiTU88dfPB0Ze3oEKxnxYH1KJaKNODPuSMzlr78Dp5aoTO42wy5T8YeLQSG1KVMH9iSn8lBUQ9wBJdlbJlvqAIdnZfbtlYkRT/PCZJTzbLKfS7jhEcIeffwKV2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8926.eurprd04.prod.outlook.com (2603:10a6:102:20d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 15:10:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 15:10:51 +0000
Date: Mon, 12 Oct 2026 10:10:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jelly Jia <Jelly.Jia@cixtech.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 2/6] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Message-ID: <asz4c0Bd4XZlEM_V@SMW015318>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-3-Jelly.Jia@cixtech.com>
 <sashiko-outbox-167869@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-167869@kernel.org>
X-ClientProxiedBy: CYXPR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:930:d2::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a62293-db0a-4549-290b-08df287300f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	beqacpF9Jk7LzD6asi7oGsHsO4wYljKZrTKni83ts2uPXrIFLzJfgdGg4Xo3Rt4ynBk81ByGozbt5kokhiQWrOH+ZS67b+dUKGBBh8aqw3hNncUaVqaB7I59gx649hff/AFWG9dGJOrzXO/FyNd0mvGV4x+i0pYcUGPedD0Zvg/06zgE3VO2C0ewnWRSJ7/hEhMIE7CblvM5zDi30PGpky536cgzLAO/QvQaUJ2Mv5q2KNaZwbZKAPUVlo2G+gL3j30VtS2NzNgMHfEXJIp8pzvGb3opECMutRvO4pqlhtp4wxL7ViNRNS/9CdgLCW27oefUNViBvr2oCepZ0S1xQsGC8yszo0yfE2BtjLAL8TPhEejNZ74QaQwHYP5FnwyvOQoP5WOTAPYK6q7xY0sHXph/4D40Dc/rOUxAKmpRnPIGAoO+leiAYqC8w7Vffl4keKGnW4iAYzioMAlL2wRzG0boNABr9Dv/+QkC+X271g5HkiChwGnkzHFwb+lG+4f1vvoLQzqmFho6THJ1OEKRB6qRAQ0EYZPrkUKxbeATS3xcOnFH6QWMqd9TABoq7r0Qka1ZvlHw5nUg1j5QIl7R5TgTiTuZCHM2HO5yqqlgtUO2lHqCtuCcVH27qULdjVFtbU5683Ro/+PCvc0FDRHdYbn1/O1ojsWzQhTenP03Nmo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rLYXyESS/NM9ozQ77BNNaW9/GJgeJJLr/GqGsIhEcnrsI3cQCxdEF4PvdOE1?=
 =?us-ascii?Q?BXLEbGybBorEE4afWW3xDDBdOWuTCnh6SooOk0so97q+uMz5NhqLA6KMJkyL?=
 =?us-ascii?Q?CK7Szi3FBaxnq1qIIQTyxEnVwpyDuQIzoK7Bp3pm3ndBOnLh0prRjntuU955?=
 =?us-ascii?Q?tG07AcEAg1vEMhQXC63ccRtvvW3vOOLoc3D+h9FiJ6OVxd3Y7LSf36NhqhQl?=
 =?us-ascii?Q?w6qLygJqT1bx81lejbUAebbp3PnsICVSmPRr49IJukve50UG9YyOsl9JfLsl?=
 =?us-ascii?Q?68tnFrh4pPscYdhW8wOWyeJeKtFQOvdl7s0RE7c9sDjLJFkgcrVgwOYbu4+Y?=
 =?us-ascii?Q?nWqiT5L4+XlBjQeCeAnt6mz+R435ysYdTNXLCGLAqf4S309W+/APhV3KNpv0?=
 =?us-ascii?Q?f5enq495+6VUuXX0jvFQauSJo50IR2MWBKTOag3kK6E4Bhhc5WgKQR3S0EUi?=
 =?us-ascii?Q?/2FYwTrmxQwl9lBsgOSmSQBwwqoLVanIwE2WXzyA7ptlCW2Iqy5B+zF8wYXM?=
 =?us-ascii?Q?++9k6uruaFSI6/TPs7pDs18MhxKjiMLHc48JHwF3W4xSCCAb9q2hmgr5jpuM?=
 =?us-ascii?Q?gYRQa5UWERNJV8SHU765gxyxdcRUvhX+riZY/hDbRnjMQ/Zdrh5MI+hOgfis?=
 =?us-ascii?Q?DKFtTCHJwCLIncxvTR/3k+uuQWpJ8GblER7LdJQhzjZY6r7+eWahcbQYk4LD?=
 =?us-ascii?Q?WIGFYULGpBQBMXI6/DZY2JwoWILoLKY8sZ7VKt6nw1Tvdl+4x+J591bgllRA?=
 =?us-ascii?Q?2ehU6EmSOug11SUDEbqVLqRg8e1tfh/CamgxjAYwPRzZ8rYBne+/2uVwWDWj?=
 =?us-ascii?Q?sm50ou5l9/oK1e49KKm4mJAWfxpegnscRDE5jpgFcPc63NYz7gBhcXqb1wM1?=
 =?us-ascii?Q?H9FlhyJaV64k7zqsUmLdvNGBabvioQo8WIJXjtPeXp6kehGIwI2Z34peutlV?=
 =?us-ascii?Q?q0sRJc2ByYEuo2KvauM3bjakkLL5h3bew6+ujg5g8EtrPXPdLT2RQZvyix/9?=
 =?us-ascii?Q?OE6IPZg8SpZJG9Ok5ByKWSNiUCTLt2cbfs3m6fQ/6ZO+RhBwQo5XkUJkx0Ri?=
 =?us-ascii?Q?b/qut+gxskhIbf8FB2XYXWFi5/a7hCPaGSrI6qUuAAJvVrxfgIbsecZunwny?=
 =?us-ascii?Q?favUAwqQN+eWc91zlxNRfwGo/z6ixhpKsEj0rou0qLKIjzYkPp4jNEKfaYaH?=
 =?us-ascii?Q?R2r8p3ubuj6jHRwKnL165M6KYzcDVyCXF7iuJnhu/qn6YW0RpuYUOKMWE4iw?=
 =?us-ascii?Q?SeaMlRCXX/4X6UTg7SrGGQAaeZ3PbzHBcaHktFCGIcuWzJ38O4y1nXkLhlYz?=
 =?us-ascii?Q?EU9Vl6pI+9Ax8IBt0Iy9p4ERcFiBUSJbp7k7WUtCJ2OUEFRcsMl/T2SaBb6K?=
 =?us-ascii?Q?6kU4mD/unGYdmJR2VHoDnKLsTuXWJqviyh1aPOhSPzppoeQlyGr70Spfk+nz?=
 =?us-ascii?Q?OAw5ySGhAPTW7QLPrI7wUQ7KZVZgot52Uyk+p+vExFa/DCw2oBBKVnZ6HW6t?=
 =?us-ascii?Q?ra1yq69wIUkapACeGD/j4uuIpmdgXDBHMMdNNHAguqyU9eYK7o0cGopyBF/s?=
 =?us-ascii?Q?JsfeKYpLWSuGObhLx32meKD01W3/7ppVP6K/9FQ/cxUQI01jqyEL1nIsvGKl?=
 =?us-ascii?Q?CSD2Nkb6oYOPndsPeaoyGSxQeDqIz/dwU/AStnsFdllKjFrucsHVu6f2S4PD?=
 =?us-ascii?Q?S+2Pv8Yoj1+DJk37MDfDBFkLjt/T5d93Jq6036MGYJQdmxS2b2pcx+6RFUfD?=
 =?us-ascii?Q?sJ1I2D3/cbFIV9vaifSOv+J1IfqXKMN04E9r1aEhcJlNXhw33XpY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a62293-db0a-4549-290b-08df287300f8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 15:10:51.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMo628DqLnraX5lZjpiNEsz96g2GoXBtux9wOC7ajpBGUxX6nkcPro0CVCxyNt0zd8kp83GGt3PT2ya2HEtcVvJJZCVQg4WRKgSeYNr2xYI7crwX0BnXYWM9/Z90OUH3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8926

On Mon, Oct 12, 2026 at 08:52:14AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dma: Premature peripheral unmap in d350_map_resource destroys queued mappings
> - [Medium] dma: Cyclic residue calculation rewinds position on race fallback
> --

Please fix all sashiko report problem or provide explain.

Frank
