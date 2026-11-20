Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795193821;
	b=ybixqZ7h62TQZAbyDjR9vxrJ5tM6QZrhF14rWBejQNOXSdLXVCmWVUc4ar0p7DtMOFHC
	 rO84EMtWCbwMosR6oMfYGMs3GGON9T/Itf9qNmQL0mkaIInQ/JRnXcE9ufgDcW9uZt+HN
	 DwciF6i6169i03G5sgi+DK7rTJ9zogSeMCrzqMGkZbadGi8WDYKNInSC9N41MU16WW5iT
	 GQH5gagidIXIqCE64JTOj7nGSoujSxQ+t00qbTTGduxfOYf+LRygIHrI0EfU/Lw/S5vvi
	 w661jFQ3kgQe3T6W+fmQYCxhPaA9VO5ISMfucASp+07e/UMptP1Igm4QK55y7CSw4dQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193821;
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
	bh=TIpmPBQ9i2WjrwmVnGWNVBrnEYSzU1mBUk6kc6WlcSY=;
	b=T8UZP3Fa1+HZ5hvBMgSWKObA35m8k0U9qBha/IpP2RfG8IY/BXF8fJl79RD9Ao5wiJaB
	 qHhIUQw1mrsOVlPrlgROLFX6Hg2g1dkGjs+mp5vqXbsM0wv6hZHYw7l37h7dm0GspgtkJ
	 gyTu74qUs7Ao0thp0xh5lJfl9F2Q5kSrex3y2r5YN0tFQCyEFDRV0pdt0xFUD5uMvMvL1
	 AClmULkJOwmpKO2ebIyCUB0O3ZJqtKp90sMOrV09rNVgxg2Iy0xrdYJRQCHZSMgx0o/bt
	 iVfbNtLVe2vEH64CCZy0SRxVRHlDWBahk5C9ShIzOBw7d0VYcwGFncX8hLKyu1oO9VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hz0lOMW3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.22
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCC60A260F
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 16:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DCC60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hz0lOMW3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmZ+R7VQA/7kq5mvS6PpEtjEzomIlutZI8XPxtFu4xCC/qPJHIyqhnu9+oMR6QYwI1kBjJeSh3TxRCg/H8DZ6LCprHKEV67SnFaLsPodtUxV2ZI6Y5VQ0TW7XOU66Ug4F54hAmrI+sEd4H7dDVDs6nPj4S+SShYb1emtIeAvJV5S8S1YSjkrMHTE5xmy4GvkWN4vl9yZAQIK2xeqVv/IUjlRUa9kwQtTEZIlhbMK6f9nwkwfTr6N9QeYiTnB6Q93d8tnJTAN2OK3HY+sU1wSAXEBQO8rFsmGcVTHiw/JMKhSF9tHkywBAUHpJsUSdFrwcv4EKRW/XgMkqzcwsC7EfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIpmPBQ9i2WjrwmVnGWNVBrnEYSzU1mBUk6kc6WlcSY=;
 b=DquBAmCJ7q2i/v6gkWh+Qit2gEMe/MDrUj5qPbOojHxoaEcYMb5TI9qmjlzb3aQ55pIz93/nLVhQlRSWRZBylV1udASQt4cshXpu4oR/1hD+pEj2MnjpCIKPe6N1Q2RQTNxkNJeI0ezmMrwEglfu7tGHM8opKWc4Xz8if2pdzlOeH7iPm5kqF3FURBhkndQ8deOV+OjiD6X21M9F6tSOm0ns0U+kGtlt5nXm4ZulaMeDZ3uIC5fnVLawmooa8JzDyqNt33aA3587etS27Okkq/40NuATaBoQ/HydIstn1dNPQXfc7wOvWA4i7vkftqB+Y4J5j1Polk5Ic4fNQWOEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIpmPBQ9i2WjrwmVnGWNVBrnEYSzU1mBUk6kc6WlcSY=;
 b=hz0lOMW30CkT34iv1JJpr6ze8OD4sbqSQJPGLL+WLCF8Sj56r1fl7W31Tu0zx8hboiZMB+d8okvN9x48AzPunPT4oZ/f5wsRCYK7IMC7pQcxnjrWk2C3Rio2ZTHjvmdcQ45GhciCtrND7fKQSvU5zaXxhz/rxWWaBi6G+6qeie6HIWu7iL2e8pIJvRdWaxyYLEOsJaBDVJjAtAT2xFbwsU7oNK9vdxk0dMp1hJx+zcN9PYJKtMQxl+dGTzUZtp5EQ1w9FwR/vKLh2/H3nJWNVjO1qizvEpbpPSna4WByNo9esbx+0BRsrEa16UqqYI6yaCwE2dPLzHp7fVDRz9Devw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7900.eurprd04.prod.outlook.com (2603:10a6:10:1e8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 16:56:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 16:56:56 +0000
Date: Fri, 20 Nov 2026 10:56:46 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: tumic@gpxsee.org
Cc: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Martin =?utf-8?B?VMWvbWE=?= <martin.tuma@digiteqautomotive.com>
Subject: Re: [PATCH v2 1/1] dmaengine: xilinx: xdma: Fix broken PM
 suspend/resume
Message-ID: <awB7zvk3iRr6NmPS@SMW015318>
References: <20261120155924.5785-1-tumic@gpxsee.org>
 <20261120155924.5785-2-tumic@gpxsee.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120155924.5785-2-tumic@gpxsee.org>
X-ClientProxiedBy: PH2PEPF00003859.namprd17.prod.outlook.com
 (2603:10b6:518:1::7b) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a5d0b0e-2509-4894-677a-08df472748d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|19092799006|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261102124227099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	SwfAsoe8yoHZPmLpTmYlLP/r8as0YbRu5H5j2QSUAShImzHG7m+gLOKn1EF4NCG+pZFHfiXi98Sk7wllq+dgDMPCasuZ/bbsKeLxFbsaTiWUcrrzZlvObzGGPe+8Vr+CT5kDs5ZMWh60DIVYSJba4qXEthqyy0grxF19rdLpDoEu1SUz00JfIkgMrS4yArtR2JOCjB9AwtiSwnYFbEVfWKjm7VQrlonVuCjfEUVKA8OR768kQ1dqGwzNILpp6Zj4TUO8PdDL1UlDgGEZM82NC/0VA4gaTlr2QuZyxpHNKxnilbAs7s2y9Qx/u/2gglZhJoabtfHOSL5S0ZFx9MQ8xgfH3aB8yDjBaLHF4IgVv4x8KOuEXtvfVs6uOo0bGBCyw7tIG3xK8Ct43ug5Om2TPFXzhnIW8libfAkgjs+3gp8DbeqtJgYwwyCWj/rOKTqdiV6Te1VjCPA6SkfVyjZF3Zty5IjCjPap/vrXhfs6/LQnvsL34fRSFA9Y0brPZgw5Y+MvKoXwskcTz98/db6s5g0leRmSsRuUP5FEzuLpB6ZImzQ/6QxWLVaCcNFj7TfybDQTEhVnNT7ndnhxeC0bt3RO5CYd0kDnVBh7jhLqGOJ314m7OonE67+1aQsKpXPEUy1q8U885m0+0b91FfyyRaxSbeo1bmoSmtvOZIzB/20=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261102124227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy9jR1hXYWIrZDd3M25TRDliaDl2VzZUWGJqN2hHQktVYkN0akRkNXNhQVN3?=
 =?utf-8?B?VVhoRDQrK0w4ZWQyUlNDQ3VndDFzSUowNXFlK2JVWkFlVHpmYkllbzhNVmo0?=
 =?utf-8?B?bnRMSmFqWmFuV0E0TDBzVE1hV05KN0tzaCtKSDQyTldVZEVEekp1NWU4YVdP?=
 =?utf-8?B?aCtiNXJZT3pjYXlQZTAyaEdFUlkzTkh0M2E1QjM0cHoxakc4eENWc3h4NG11?=
 =?utf-8?B?VE5yTkdGQXpLVGdYQ2RrYmpqR3pRWTNyd1BXZGRHeEJtR2p1SHRhOE1NcjRZ?=
 =?utf-8?B?dGVreUQ3czdWcmkyT3RHb0tpYkdzOEJFeTllMkw2ZHN4bERwY3lldy94ODBM?=
 =?utf-8?B?eXI2OXFlbXFkNDNtS2VhdnIxYUhLNTFRbVNqbkVmOTdLTEpqa1NVeUhKSVlP?=
 =?utf-8?B?N0ZyWjJienBFYmlqMjRrZEJxY29kVWhLU1hHTlNvYmpwVU9TK1dYalMxOTNm?=
 =?utf-8?B?dFNoT3J4TlNNcHE3VENReWorUVNHekl2bXI3ZUU0dmhsc01scHoyWnloSjRZ?=
 =?utf-8?B?SlFYTUVTMWw3Z0d6aHdqMjAzTEtTVzJJekRqdkJXaGxMNEYzY2tmT3NPRHVO?=
 =?utf-8?B?VjlGdDhuYlZjc1Q3OHhwQy80VUtBeVZ2blZweU9XeDR3UEd4dXJaMS9rMGRL?=
 =?utf-8?B?YmwxdlgrV1graWtjSldZazVWTW5jaUp4S2xMOUo5TzlOait0ZVBEcWR4OFZZ?=
 =?utf-8?B?QklRMFN6blZOeXZpcDlMRUFtWW5tcUNOaGxUdnJ5TjVFa1hRREo0WWhxNHVi?=
 =?utf-8?B?MGJSNWx3cTJ4UlQ4TnpoWDA0NjhtbDhjQlZJR3JJVzUyanpEdDNNZldsZTdl?=
 =?utf-8?B?Z1VFdllwazJiMTdwQnoyTlBGOHIvamFNOHZHVEI1UDgrMUZXeUxLWHFMdlJM?=
 =?utf-8?B?bEtOUDNKYlRYdzg3ZnNKSHI5eUp2eHUva1JWbFN2YWhqQ3JzejQwY3lsVGJ1?=
 =?utf-8?B?NTFnc3dsYVk0R21EeC9wRE5uRmU4dnk2blo5TWxGTTFycDNNMDg3bE5kQ2RX?=
 =?utf-8?B?WEl4ZnBOYnZ2RGFsaWdXZzcwY2tjVDQwd2w2K1BZMFUrbmc1Uy9RNnlvNTJN?=
 =?utf-8?B?OXRaVWRtSTdvcG9rUTRiY2h5NmhQc2hyU0czei92cG5YVjZPTUhhU2w3c1A3?=
 =?utf-8?B?U0FqdGxVelFxNmI0R0RrbWdQU2hFNEFYMmYvVGNEcmRacGhidDdhSDVhTzM2?=
 =?utf-8?B?RzJVdTIyeS91a1dTdmNhemh5Z2ZyamFIWTdVMTRyV2tCcS9IcHRuNFNBV05j?=
 =?utf-8?B?TzJhZCtZc1JWajhKNW1kRjNhdjA4OG45cnRqbjRBOCtOMWpmL3pTRTdHL1NV?=
 =?utf-8?B?blpRbEh2ZHcxZ2Q4MEZBemQ1bTZuSGl0TnZVdU1pdDE5bjR2NDRmd0V4TndZ?=
 =?utf-8?B?RDhOMXZqZWRuWGpySjhmOWkyWWJZV2xjTENHc05lVlA2cVNyQ2xrbzRRck9k?=
 =?utf-8?B?Y1pXYnA3RkdHUm5iVXFuOGFiWEwvTWZ2alFtVFNkWFNraWx5MC9XY1Q2NEEr?=
 =?utf-8?B?cEJZZy9wWTF6OUxYVS9KTnVBdG5xM0JBcnIxMG5DcSt1KzdoSFZnM0I1NzZ1?=
 =?utf-8?B?cXJTSXZPd0FsUHdUVkM4WDZJZkFHN2xPUDJnWkx4MjhISVRPR1JEY2wxY3Vp?=
 =?utf-8?B?Yk1xYTBScVE0dkppTVNpWmdpdGo2a1Q0enkvVU5yWUVZWTJLRXEwcG8ySy94?=
 =?utf-8?B?alVmc3lvSm5sTnZIZEIzYW9EaGZkeGVFdnlzUmJDVXhmcWlnWkJNNTJYSFhW?=
 =?utf-8?B?ckM3VEJzZmoyOTNNL292ZUdrbURXRDltYnYrVEkxcDhJaFBZUWZ6TjZNUWNa?=
 =?utf-8?B?dTFoT2w4aTRzdnhkSDNKNm1ZL2x5bU44SGh1d1NLUmxJcTk2dHRNUGVXQzQ2?=
 =?utf-8?B?OFFlQ2U0M3puYklaemw1TFh4d1QwMXJ2Yk9wZndnQnlDR2pGM2FxMnNwM3Na?=
 =?utf-8?B?SlYwNTRmTVk5WDdLSU4vOEJ1Mmw2ekJ0SHV6T084dk5sdzd3NGwvc2pWT3po?=
 =?utf-8?B?ZEtoR1pTaUpia0Y2MG1OSHhUbDRBQzI3Wms5RWRVVmE4cUswM0c2WGVlMExm?=
 =?utf-8?B?Wlh6cjFNLytuSG1lUE1aVzlYMXBKVlJqMnlLbWF4NG9UTVdGbkVGOWdwczE2?=
 =?utf-8?B?UEdRVHplYS9XS0dMRXVPYWhLNFFEblZ1MFNHOU5SbHF3MmY4T0lhekxES3pN?=
 =?utf-8?B?WnNwYUdiblc0QXB0TkxxM2czUFZhSlZOa0d1cyswemtXN3crVTVqM3RsVkl1?=
 =?utf-8?B?VjhnQUFZNmdaN0luc3YzOEF1REFaeFBoelRxZkgyc3VPR0tmREdkVnRyM2Ux?=
 =?utf-8?B?SXRRMGtIcFVvRGlOVEhWeTJMRVFsUzMvdVJqdm0zTXczcFdZL3JwYjdKL1hI?=
 =?utf-8?Q?G7V2R8bh3G1/PY0xZ2ZVZvBJpmhBXTY/erlIa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5d0b0e-2509-4894-677a-08df472748d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:56:56.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAHj+8QA+yq6bnN/sTBNNy4+nHS3Yb1ZntuykuNJTyD5rOi6SkRALElGsMDnBG2qcSD60Eac1PCA/5L17yV6sJpu3ohsf9yIKudQyvglmnchxj2VsjQlmBtY4kBgQqCT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7900

On Fri, Nov 20, 2026 at 04:59:24PM +0100, tumic@gpxsee.org wrote:
> [You don't often get email from tumic@gpxsee.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>
> Add the missing PM suspend/resume callbacks that properly reconfigure
> the XDMA HW on PCIe suspend/resume.

why need reconfigure irq ?

Frank

>
> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> ---
>  drivers/dma/xilinx/xdma.c | 121 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>
> diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
> index 9d827c9a1267..fa006c9bae23 100644
> --- a/drivers/dma/xilinx/xdma.c
> +++ b/drivers/dma/xilinx/xdma.c
> @@ -123,6 +123,7 @@ struct xdma_desc {
>   * @irq_start: Start IRQ assigned to device
>   * @irq_num: Number of IRQ assigned to device
>   * @status: Initialization status
> + * @pm_usr_irq: User IRQ vector storage for PM suspend/resume
>   */
>  struct xdma_device {
>         struct platform_device  *pdev;
> @@ -135,6 +136,7 @@ struct xdma_device {
>         u32                     irq_start;
>         u32                     irq_num;
>         u32                     status;
> +       u32                     pm_usr_irq;
>  };
>
>  #define xdma_err(xdev, fmt, args...)                                   \
> @@ -398,6 +400,28 @@ static int xdma_xfer_stop(struct xdma_chan *xchan)
>                             CHAN_CTRL_RUN_STOP);
>  }
>
> +/**
> + * xdma_reconfig_channels - Reconfigure DMA channels
> + * @xdev: DMA device pointer
> + * @chans: channels configuration
> + * @chan_num: number of channels
> + */
> +static int xdma_reconfig_channels(struct xdma_device *xdev,
> +                                 struct xdma_chan *chans,
> +                                 u32 chan_num)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < chan_num; i++) {
> +               /* init channel hardware */
> +               ret = xdma_channel_init(&(chans[i]));
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * xdma_alloc_channels - Detect and allocate DMA channels
>   * @xdev: DMA device pointer
> @@ -1018,6 +1042,53 @@ static int xdma_set_vector_reg(struct xdma_device *xdev, u32 vec_tbl_start,
>         return 0;
>  }
>
> +/**
> + * xdma_irq_reconfig - Reconfigure IRQs
> + * @xdev: DMA device pointer
> + */
> +static int xdma_irq_reconfig(struct xdma_device *xdev)
> +{
> +       u32 user_irq_start;
> +       int ret;
> +
> +       /* reconfigure hardware IRQ registers */
> +       ret = xdma_set_vector_reg(xdev, XDMA_IRQ_CHAN_VEC_NUM, 0,
> +                                 XDMA_CHAN_NUM(xdev));
> +       if (ret) {
> +               xdma_err(xdev, "failed to reset channel vectors: %d", ret);
> +               return ret;
> +       }
> +
> +       /* reconfigure user IRQ registers if needed */
> +       user_irq_start = XDMA_CHAN_NUM(xdev);
> +       if (xdev->irq_num > user_irq_start) {
> +               ret = xdma_set_vector_reg(xdev, XDMA_IRQ_USER_VEC_NUM,
> +                                         user_irq_start,
> +                                         xdev->irq_num - user_irq_start);
> +               if (ret) {
> +                       xdma_err(xdev, "failed to reset user vectors: %d", ret);
> +                       return ret;
> +               }
> +       }
> +
> +       /* reenable channels interrupts */
> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1S, ~0);
> +       if (ret) {
> +               xdma_err(xdev, "failed to reenable channel IRQs: %d", ret);
> +               return ret;
> +       }
> +
> +       /* reenable user interrupts */
> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_USER_INT_EN_W1S,
> +                          xdev->pm_usr_irq);
> +       if (ret) {
> +               xdma_err(xdev, "failed to reenable user IRQs: %d", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * xdma_irq_init - initialize IRQs
>   * @xdev: DMA device pointer
> @@ -1297,15 +1368,65 @@ static int xdma_probe(struct platform_device *pdev)
>         return ret;
>  }
>
> +/**
> + * xdma_suspend - PM suspend callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_suspend(struct device *dev)
> +{
> +       struct xdma_device *xdev = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = regmap_read(xdev->rmap, XDMA_IRQ_USER_INT_EN,
> +                         &xdev->pm_usr_irq);
> +       if (ret) {
> +               xdma_err(xdev, "User IRQ vector backup failed: %d", ret);
> +               return ret;
> +       }
> +
> +       ret = regmap_write(xdev->rmap, XDMA_IRQ_CHAN_INT_EN_W1C, ~0);
> +       if (ret)
> +               xdma_err(xdev, "DMA channels IRQ disable failed: %d", ret);
> +
> +       return ret;
> +}
> +
> +/**
> + * xdma_resume - PM resume callback
> + * @dev: XDMA device pointer
> + */
> +static int xdma_resume(struct device *dev)
> +{
> +       struct xdma_device *xdev = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = xdma_reconfig_channels(xdev, xdev->h2c_chans, xdev->h2c_chan_num);
> +       if (ret) {
> +               xdma_err(xdev, "H2C channels reconfiguration failed: %d", ret);
> +               return ret;
> +       }
> +
> +       ret = xdma_reconfig_channels(xdev, xdev->c2h_chans, xdev->c2h_chan_num);
> +       if (ret) {
> +               xdma_err(xdev, "C2H channels reconfiguration failed: %d", ret);
> +               return ret;
> +       }
> +
> +       return xdma_irq_reconfig(xdev);
> +}
> +
>  static const struct platform_device_id xdma_id_table[] = {
>         { "xdma", 0},
>         { },
>  };
>  MODULE_DEVICE_TABLE(platform, xdma_id_table);
>
> +static DEFINE_NOIRQ_DEV_PM_OPS(xdma_dev_pm_ops, xdma_suspend, xdma_resume);
> +
>  static struct platform_driver xdma_driver = {
>         .driver         = {
>                 .name = "xdma",
> +               .pm = pm_sleep_ptr(&xdma_dev_pm_ops),
>         },
>         .id_table       = xdma_id_table,
>         .probe          = xdma_probe,
> --
> 2.56.1
>
