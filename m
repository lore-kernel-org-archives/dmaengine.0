Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131657;
	b=fWSER1KZyhf6EdOutveXbEP6JhqmdjrYHQXC2EO0kdLgX/xv5okJHdrOb6wwGtGl52xR
	 /QZNisZkJSd8zh2GsSYkCU9zf8tHr/B+utg6gyq7TUfnRvFTHt9pNeWR4jcFSvjPyvRoU
	 sf0YYwzoV1/LoErLFJVNaBWv9vAQo5ZOWyjMk0fo//+IL0wK0fbsTYD5vIxTxwXBVmjkS
	 YYQ7aGngFr8usbm+uiwhAeG1fR2/d6RJlFI98svf75WkxhGWInlTNEYJaQvYpbs/QSZG2
	 YsElXPyPaYLVPLjUfW+zrhaA6Di1FFqYGmHzV5DFbt7NOVLuJzWFjZn5WS9JrLmdStw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131657;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wTwDA6wphtfM4nceA9wYffGbL6L0C0KNn61HY6B1RUo=;
	b=qLECNLAuBec6t3dnKSS0cVU7rvgCf7vYGmXAhGZ2jfL/aBs9TdO6C5UcjuaTECszvrvV
	 Gz5/U+ddjdt65v5kT5ySvAL3bFIV/tDF9dZAI2c1Zo8lvIxY22iwwsJ4p9T9hlEf0I1ek
	 CRvNesJpTWPw89kr/JXZmbZnUqAVAOBEnWHqJy5VOiceV4cTJtSMujTQpX9WzJYuHG8kH
	 9Ai0yT7sDaHw1r+DvYFM00qFBvqqxB87M2YBMRivxamZet03LFrg8lPg+aNOsLY50cRM1
	 KshUWiQjLnQq93lhzS4JKPLmtKS0FJrd3fyNhmCyYv0/wYj1diYsdGabtmjAIilPxpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Rennyo4d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.15
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A4606A31A;
	Tue, 27 Oct 2026 20:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Rennyo4d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBHhkLZjf3P7kg0GqGwDEUvGbhy0ayb0CNuQHec+5jXvkLqw/JAmDl/i6FOc4YOy+p8agy8liM0lRYiNtTWeoIpRufolf6clBbgKnw8rZrUbNHqotAz63QQnFgEPCGsNgCrGiu0vPl6uZ8kZ0XrsxdxgyI4zm+KJMfN8d/HwwA7vCjMqwCxZMzoZBXJgasnuqqgbolvoIUE4xRucdu7WkhlO7azq3i52ilkrfYvLyUgyuNky9rdcOry1v4QptB9d9EyzfaQtfvp1Mt0JzU4MQOgi9tggnBQMlO/Q9cwElcFE6s5d3Z7t3oK4A0QVXlzadL3p2ENVdvGNjBoEnDTxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTwDA6wphtfM4nceA9wYffGbL6L0C0KNn61HY6B1RUo=;
 b=dPaLLTVGOWNZZbP72N+ngmva43V1ocJcKH5mw240tgXsA89pb1ldHcy8ghgqVW6UBGxGcXkzGJYLGLMKNzraWpHCHldeGtBOvBc/UOeH0JfYBKpZNXmvYS6Gmdzb3smdps45kzWEO0hOFZJ9gJk741+m+i1KjTOQeLxbSKtZWMFx8l16t2R5glWYzgYwdFcQs70PBjwvwHBH7FQ937QAkSZll4gPaYWnrJFrdC/EwQkAvPoxK8a/uiErTxCQvPbelEizh/B2R7vJArT9mfijsW+HLj66EeFFlkgdiQLthZyPcSScWIhtz0LuqBYQYy0G7YsrmOPkXEMU6WGT5lcyCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTwDA6wphtfM4nceA9wYffGbL6L0C0KNn61HY6B1RUo=;
 b=Rennyo4dXxsT3B8cs94kuYhrAGMWqaoH2SRe2PNgzMUChqZykGI762TKMobLdFirskxVO+cCuYZzKmmyWg+CYm/YsHI0yMU2urIoB1IJMbdFI6hpYFtNF8frfuYXfhtDfMJ66ZD4QThXeoOMffzayamrJ6Ht60aEGW4olk3wZiKJLiI92ew0vKP9R+HnsNxB/okz7+1rokp+tLTmcoVGgi6ViywzkBkMuLM4mSBhpQQv157BFrNKF1zqB/5Ow0S1udXG/dZLY/WAe1YU/J2VtJot0gdTH/ED6mzIiHIm3fpAWiD8pU/C8sdxZn5IvTi80zurmdWk+J3/rKkphSre4w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8377.eurprd04.prod.outlook.com (2603:10a6:10:25c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 20:07:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 20:07:33 +0000
Date: Tue, 27 Oct 2026 15:07:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
Message-ID: <auEEfbj9HqzuC3n_@SMW015318>
References: <20261027070037.1809112-1-andi.platschek@gmail.com>
 <auC3nGX0hA494DZL@SMW015318>
 <CAGdJsvY6BfOG4gS7qDfgqNERWPGQ9_Y33CmFO3NFcsGGqD8viA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGdJsvY6BfOG4gS7qDfgqNERWPGQ9_Y33CmFO3NFcsGGqD8viA@mail.gmail.com>
X-ClientProxiedBy: DS7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::14)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e66e7a-46a4-4d45-f439-08df3465efed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|22082099003|18002099003|261026121527099003|13003099007|261026135527099003|56012099006|11063799006|4143699003|261022113327099003|10067099003|261021133027099003|261021121427099003|261022105027099003|261009223027099003|261021130227099003|261022115727099003|261021135927099003|261026140227099003|261022075727099003|261021123027099003|261026130827099003;
X-Microsoft-Antispam-Message-Info:
	DUB0IxmVE1MnTKgasa+yrDM4cuCadsebazAi61Zempib5PhrNFrn+1vo0obkNDQGqEYGq0rGLXNBNeurn0RPV6XwmxE3kMkJ61Zc931QSQJLNBD6l3Ua2Yiux4tkQyiFepYlb9BgVyxomDqm/BkiaeGBFpV3p0Lq5CyXRstxn3F82bGGj30bCzQDGLW2z83IFpKp7Xd82UTUOUnTRzmsO5d85cio0pTtmQapfhcy78t/AfdLPaubsmXC26n8B0zF7d6Eq9akHFmhMLkSupCNOg65BPKibVhS3zET16dGdiRo59Y61jajo8WMcuua44KRQ/tKY1PHAwHq6STjrApkkjo4+ESbdA6jIB/6TbJymwKR7BisoUO3aQpD9jasPy9U57NwcBDGd26HUwWuxTf05ZpN/k2YCx0gYQ6Cl6p7vzLxXMxQVcY5vZqnD8v8etZOfa255V3/tO9RXpKQrJSGVTqCH1S0ux9O+zJlQv6V1dvu5w1EBqrBUBI46RaNFXMV3KvOYPieTEaTGICMIzej6N8h92qVnijX93KXj4GN4AplSxl1fP/rJEeh98gCajt2ryUvT/tAM63ynAIy8EppQ4AfH8bnpfijBRJ2WOliLwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(261026121527099003)(13003099007)(261026135527099003)(56012099006)(11063799006)(4143699003)(261022113327099003)(10067099003)(261021133027099003)(261021121427099003)(261022105027099003)(261009223027099003)(261021130227099003)(261022115727099003)(261021135927099003)(261026140227099003)(261022075727099003)(261021123027099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1p4ZEs3Y1JZNUZHZ1FUQi9QSnNDU3loM2FLL01wUTdpR2twUTFKb1Bwcldn?=
 =?utf-8?B?d1FYOWlySHJWNUtwQjdDUGVSMXdvVlY4aHY3MmZPUWljc3JuVllWanM0R3gy?=
 =?utf-8?B?cVgwbWJFRzFYOHBGVXVhQktENkFocFBMemxET3NDbHhOVndaK2Q4bVpmanhG?=
 =?utf-8?B?L05SZFNXNVhrV1VrTUhDalQ4bXhSK1BxUSt2Nlh2TTROWTV4L2JrVW4rSjJF?=
 =?utf-8?B?Mm55Wm5ETHJhVFQ2NzdZaXRzR0Y0OXRYS3NXRnZVcjFFNURwTXJSY2hRZHMz?=
 =?utf-8?B?OHpUd3kxZmQrZEpCdmJmSXpXWWVhdkNJUEhEcXIrY29TM2lod24rRFBNNFVE?=
 =?utf-8?B?amc5d1IzdnUxTWYvcDFyN2VmUm1IK0Jsb2hVTkJBR3pQWjdNazFDNnBmeTFR?=
 =?utf-8?B?REsvUkhTMzkrd21zczVmWGg3WVRqclhER1hDamxRcEF5K3FMSDhzdVFYQmJD?=
 =?utf-8?B?aVYzMUFTa0VFWkNPemdxVStCL1ZFVWQvYnNrajFIaWNSVUZjVnVNSHV3UUpN?=
 =?utf-8?B?RFhod2NMRDBJemVqYUxCcUZOekIyT1h0U3RPMTVrTVhycXRuQkgxR0FROVZT?=
 =?utf-8?B?NWh3QmdTY0dIQVJ5Mno2WHlvOWgrUDhQM1N1aVJrUitOczlCWFhzS0FnakVH?=
 =?utf-8?B?OGNlNW1wcElZRzNhUEZ0RlVOU3FsMzA4bUJTNXg4bzU3a05pSUpmVS9ZY090?=
 =?utf-8?B?VGxKeS9jUm9VUHQzdDN0cWlSdlhKMnVYOHo4VzcyeVd4OFd4OEpZWmkvNGcz?=
 =?utf-8?B?ODRqYWpIWlFFMysxUnYwa3NZajlqZDVDYW1maWg0aDNVOG54cmRqaS9NbUhi?=
 =?utf-8?B?dEhPeXl5WXEzSTduVmZCSHlXL1BZWlRaUDc3cnc3SXdrdGZUNEsrTFhlaUYr?=
 =?utf-8?B?UVAybDhOTGtIbDlsSHJsYldOU0FkZm1yaTg5S1dieGdqYmQwZkU5WXhjRnhK?=
 =?utf-8?B?Z1M0MnNGWmd2emoxbDgzUWNWNkdqakZpQ3EvNlFIbU52Y0YzL2J5OVlqb2NE?=
 =?utf-8?B?RWEya2xWWFhFUDBIdG9zOVFCQVBSc1JrdHZIcktvNGV1N3ZBaWJJQS9RVTky?=
 =?utf-8?B?RGhROVBidGZyc0tCdFFXSUViRU9GRzBlSWNwYjJIYlpGODBJOFFRTi9nWHhK?=
 =?utf-8?B?bytTVndEUzk1VmNMM1FpZTZSS3F1ZEVSU2RRSVZUcHdjYU80Vmo4bDFSUU16?=
 =?utf-8?B?Rk45ZTliUkxkdGJkc3hVSWpsb09zeklZVzdoSHNYZjIxS2ZsNkhLdnltdUg5?=
 =?utf-8?B?aFZHRlIyVUtOZnJGQUJjN09OSVdtK2UwVkJCYVBWWnJmMXlLK3VvOWo3MDl2?=
 =?utf-8?B?V3VtNTBFT1djTUZsRVhvNFdRMmJaVVB4bUdGcEJVcVJ6NURpQTdmV0xmdE95?=
 =?utf-8?B?cEpha1MrUTBBSHlxaW9NVDU3MzJSYjg0RmsxNG9wUUxYVEd5d1Yvd2d3Ukl2?=
 =?utf-8?B?WnRFSTczYnZNV1BUV2JUa1NwOC9iWGZPNXprTVg4YVl6KytqNVhnQ1dONFVD?=
 =?utf-8?B?VW40VzVXdU51SVBXSkg0OGJlN05kZjh3dXExdnRHc3c3YWwvOFhZYnVKZE5r?=
 =?utf-8?B?M3dPSzd3OHRySUZyWm1HRlVXOUVHSWo5VW1aM0l5QmFpQnRtM1ZrN09iOHIv?=
 =?utf-8?B?NHNMcDl0VkhTRWg2UEJFNk9wNzAvekY4L0dnc0N4QVF0NHF0c1JJWWhqS2p6?=
 =?utf-8?B?WnhhZnQ5SllEZi9iemxsaXRIb21EYTlvbFQzMHM2WkpIWFVqS3NLbUtkTkxr?=
 =?utf-8?B?Z09IRVNsMkRTRUx2KzBSU3BMbzRWYk9WR1ZSVVIyVUdqQUZWRWlab0RXa3V6?=
 =?utf-8?B?bkdmOHpoVnFwNW1BVUt5WlV3MGNVeDBHRFFiUi9jbWdKZHR1eXdRcW5OaGxz?=
 =?utf-8?B?a2FGTHpGVlJ0SkNTTGcyUWpDNHEyRVQ1S2RjUHEySGZvR2hENVhyNzlpVXcx?=
 =?utf-8?B?N0ZKQXNMcjlpRW42ZVUzR3hBd1gwYkk4Q0c1QSt4bWcyRDdKMHl3MjlWUW5Z?=
 =?utf-8?B?SEo0THUwUFR0Mm9sRHFQQTAyTldueDNFOFpFdFhLYTNtRmgwc3Q4NE9tMkhh?=
 =?utf-8?B?YkRNeHF0cUFEa1dlODVnbld4Qmxvc3RIZHYyWjhDMlBkVXdHakxnSEpRSnMr?=
 =?utf-8?B?REtvL3BXZjIwWC9nVjhCZm91eWlhaXlXU24zKzNnb2JEdDhydjZDTDN4VUpK?=
 =?utf-8?B?MDR2a2ZJOWwyZ3RwK0trOXU0VVdtbnBlUmVYU0NhTlpkd3NOQWp2WnRicDVI?=
 =?utf-8?B?VSs0cmpLTExjMllLN2JtYU9jUWx4UjEycWRyN2FiTG1qSVYwUnVVZ2tqdnpR?=
 =?utf-8?B?NEQ2VW9Bdnc3MHhyRytTeksrNW1sWjNsZzIwQ2JwV0dldVlkVDB0VkE1VHB5?=
 =?utf-8?Q?QYcQ9od5BS4b0sw7dggq3NRmRW7f2/9lNetCI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e66e7a-46a4-4d45-f439-08df3465efed
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 20:07:33.3379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43g6UaeWTJqZK5yDbLwqrhrzIBf1mBFh2d5Kp9f1dawjWSG6lNs6M0E11880JV1fG0tE79S+/+J5swvACMEBRgS+VkDeLDkLVBI9Y8ZowTuU8BgE2GgeFENBhOXQO3tG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8377

On Tue, Oct 27, 2026 at 07:25:10PM +0100, Andreas Gabriel-Platschek wrote:
> You don't often get email from andi.platschek@gmail.com. Learn why this is important<https://aka.ms/LearnAboutSenderIdentification>
>
>
> On Tue, Oct 27, 2026 at 3:39 PM Frank Li <Frank.li@oss.nxp.com<mailto:Frank.li@oss.nxp.com>> wrote:
> On Tue, Oct 27, 2026 at 08:00:37AM +0100, Andreas Gabriel-Platschek wrote:
> > [You don't often get email from andi.platschek@gmail.com<mailto:andi.platschek@gmail.com>. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > The pl08x slave engine channels are only ever handed out through
> > explicit requests: DT clients go via pl08x_of_xlate() and the
> > platform-data path uses dma_request_channel() with a filter, both of
> > which end up in dma_get_slave_channel(). They are not meant to be
> > published in the general-purpose channel table.
> >
> > Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
> > core treats it as always-private. Without this, if a dmaengine client
> > is already active when the device is registered,
> > dma_async_device_register() takes a reference on every channel,
>
> Code change is okay. Are you sure the above description correct? where
> code set it active when dma_async_device_register().
>
> I do think so, because
>
> async_damengine_get() -> dmaengine_get() is called from crypto/async_tx/async_tx.c and increments the dmaengine_ref_count.
> This way the dmaengine_ref_count is already >=1 before the pl08x dmaengine probes.
>
> dma_async_device_register() (in dmaengine.c) iterates over the channels inside of the following conditional:
>
>  if (dmaengine_ref_count && !dma_has_cap(DMA_PRIVATE, device->cap_mask))
>
> and in there a dma_chan_get() is called for each channel and increments the client_count. With a client_count  >=1 we fail once pl08x_of_xlate()->dma_get_slave_channel() is called.
>
> setting DMA_PRIVATE prevents the client_count from being incremented by the core, keeping the client_count at 0 until a real client requests one
>
> hope that makes sense?
> best!
> Andi

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>
> Frank
>
> > and
> > the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
> > because the channel is no longer free (client_count != 0), leaving DT
> > slave clients unable to acquire channels.
> >
> > The memcpy engine stays public as it is intended to be shared through
> > the per-CPU channel table.
> >
> > Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com<mailto:andi.platschek@gmail.com>>
> > ---
> >  drivers/dma/amba-pl08x.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
> > index 543c2eb8cfa8..06881d3f29a9 100644
> > --- a/drivers/dma/amba-pl08x.c
> > +++ b/drivers/dma/amba-pl08x.c
> > @@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
> >                 pl08x->has_slave = true;
> >                 dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
> >                 dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
> > +               dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
> >                 pl08x->slave.dev<http://slave.dev> = &adev->dev;
> >                 pl08x->slave.device_free_chan_resources =
> >                         pl08x_free_chan_resources;
> > --
> > 2.47.3
> >
