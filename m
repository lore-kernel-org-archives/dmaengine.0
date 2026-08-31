Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A23D45DF;
	Mon, 31 Aug 2026 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180030; cv=fail; b=uLOSRFXbJ08xtPW4DNYzm1wgUJbZgo+f0ALvmyBuAXk3xB195gHZtG0fbx2P8zRZMcINXwZqBdcxTjcHh7VSL/CU8+NG0TGUNC7ljf6WTOTwHh03sQao6fCR2BrOffwRxtLX7AhgFAZxOkUG4FbpXfzbijL/XZmsoVsoHNIREnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180030; c=relaxed/simple;
	bh=wO8uDB0Af/qCP30MsAQQTYa0tJglpwilFIrjw/Dqz8U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l+Y7CTn1WsTeyvtlMH0gGJ4A4kDKkvKqQxzyC0fsRIHAVV43cBCeXycafIu7IajjgLT1P59/796BNBeyssII30tPI78alADpoQbHYh5qOJrBWHt9zfk3WTCZ2sNjXlyQzcaRVjKfnR5vAtRx9mGQMSHj5GfWR4lAd+np5sJKOOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xkDjDXhd; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xkDjDXhd"
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VB9nDr3721441;
	Mon, 31 Aug 2026 08:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=C0k+j
	LOlkLpC57a1uuuC0p0cwZKlMpzv+0Vm9qSAbBw=; b=xkDjDXhdCVZO2L0f4E2NM
	lDco5Yr1xMEnLFNXR1k2ucEtFqmGD342HcfTMtaj9YTR+2CWQFDfafnNR24QoIvM
	y6OpA52iu7N6/PUD5lGleaGihTYag9wHmPLycwCjkISFvDR4hHi/gjgISTIYHOEL
	QITB0dXTA4nJDKR5CQNrhqsbPp8V8pQVn34+hR32oVvN3515f/cy/tBPgzxzbpz3
	g3wJRGKQffcqcX7dI5mQtaMqDFKsLuROG6DQ270PSnAww2swj0rYboNzeH33rrzG
	UK0I73ILEUk1Rmj0nItkVnHcslWc73eXAX6yudTLB2JBN6UNR3LNHXiQVByEZo+N
	A==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010033.outbound.protection.outlook.com [52.101.193.33])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gchfdb8c1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 08:40:25 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ2eu8z6NIvkF5ln85c8C8X8axMH3R7PV2hISLRbw6jjvVpoIbt49WjBsD2e4CcuRXLjKI8tsh5xx2P7iJKUF2IrgJN+L90sAQMOidFVB8pbxA1L63sDFa54Mo7e2zYpV0ii6kMKyo/RABMVurm/YqJL4DOQkx/9RLZzGJeC+lIv3QbKek1DI3RbD/M9Ku5zkjtYUGRxU7xusDG869QBHHmReR8bY5ng33vj1Zupav6AT1SKxfv/Kc6L9Sd76m4F5lvIrgO4yTozOlpkxsg22NnoeEQpabppt5VrCwuMYagljtKuWQ09q2JSKMW/5CF8W7uVy3+d0vZZnvlbVG3JTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0k+jLOlkLpC57a1uuuC0p0cwZKlMpzv+0Vm9qSAbBw=;
 b=cD2bAv1x9/bwzd8UzPXxo3XJCX+X6KiNhwSQVmJt70OO5ULbYfjUVghxYyT+fgNhoPviiJuG1PH6sDRMrUSzvY6tLpf8qfqilucYKcMCXTPdDOwjOkyE//sZVmEBSCXlmRleeiYx9Zwy/ip4T0TiCX5Fa6Qaa5oRL31iMHwjizpv8UYjMgV3DwSiH2wFE7c7MPrE3wJ/RAwjnwT+XYchKzGd7KKLNwQ7kov+G/U449X1x1u61XgvLmRg7uTqOeD+rZYx6dpdlmsKWel9nhPrOGh5icBP/4tHoQsOdRjdHolRiKwStM7Nbe36e7VXv19Z4M6lGNAl4Oqr73fTjFJB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CO1PR03MB5700.namprd03.prod.outlook.com (2603:10b6:303:6e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:40:23 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 12:40:23 +0000
From: nuno.sa@analog.com
Date: Mon, 31 Aug 2026 13:41:36 +0100
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v3 3/9] dmaengine: dw-axi-dmac: Use bus width capability
 helpers
Message-ID: <apV2bCpCub1gBSQA@nsa>
Fro: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-3-507d97496f2d@analog.com>
 <20260831115819.F17781F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831115819.F17781F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA3P292CA0064.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::16) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CO1PR03MB5700:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b10fa2-8539-4593-956f-08df075d06a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SdfSqHy+5k4576dIdHV9C9hd38CfN0WF6lGinH9XDc/+4qT85wJyESxZpGfdqinU0RcSB36xdVK8hZ3ECHzPs80FXp/8Li5WxekIuuT+0VWYauJdMMmJFW6pjAoBQZT2zj0GWlh6zGSP+g8ER6Ohzb1Xb4A0SuFdQU6V5EepIlr8fCbcsXJD9tbgkbF/B77+f/bPdoDSgYKQCpuMMZ9XE/6CnKNBm/i76a8rQK70CEU6DI77Lk7Yho/rsiOw2eudeRA0SW37G2XVmmW1pAq1jwB8Vh9ArcmEvhNi741PCUcrTM2PWerMRN8LJVSc1eoJaMcM3iPbAdwTu8IcDua10q42UiWieNsrJKLuqQrvU8nyw1gpbjX9DMa07bAXVjUky4NU2f9tDFmdbI+LK+GLs9MITXjyAHbD6zsyafDIQCy4DPTGm3L9sEL4lh+zOo07QSq9MmlwMMJUJicrGlHloRTuojZ1NVlXwG4xdjbMohFLjiTEzhugD5MjS6AO0/bM0WZUxvyOXG99kzco0WiHulvJbYR+Uvp74CN6gzKA4MrzuxnJKH6ZWyl/qeEYBMQVsgXLsDbMt2zPAmWUHbXmsSRfRRAlGP9q7V4c9OhDKF8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3lTeE8wdjFzRGdkMEF4ZmF2MGorYzZpNEpjUW5Jd1hwT0tTK0RKVVhoQU1T?=
 =?utf-8?B?Q05hVlhCMTVCZFRXMVQvUkxjWThQM1MyV3h5eEtHU3BYaXNURXN4SWhmaHdT?=
 =?utf-8?B?UjNzcEc0TG9Vd0hYMEVVbU1GUGdOWlJ4eW5UcDRBdHF3d3pGTUFnRDRZV1gw?=
 =?utf-8?B?ZXd4NHdYRmJPL2paM1ZmUUVGVGRwckRIYlMvM0IrUTNhNGRyeE9VWlBIWndN?=
 =?utf-8?B?U2Y3Sndja2ZoMVpwS2lERUg2Q3kxY1BtSzlmNkdZYjYyM3QrTDluN24xT1Ra?=
 =?utf-8?B?U0dnU3pQbzhCNnAyRjRjTVJlRStva3N5eU1DUWpJZTNIWEo2WmJZYnFDeE9m?=
 =?utf-8?B?WUxSaEd1R2ZCL1FuaDJtZERVZ0pWVWVxRGFJeUlJUGxPNWRBOWtSNXZjWVAz?=
 =?utf-8?B?V3JpNFlnVlZNMGpzTXNtcTRERmJiTjlxdThVakE0WnpYZER6M2ZNckxQY08y?=
 =?utf-8?B?N2UrY2oxaVVTdE1oeGZHTjNKWVo4QUkwWmNoTk1sRnYrN1ZDMjQ2b2tHd2V5?=
 =?utf-8?B?VWFIVWVXQkdveHN5VnBJY24xV1NMV2MvTGh2aVZzaW9jOXRKM2FVNmRNTmxn?=
 =?utf-8?B?K2k3MXBjbC95cW5WMkF2eUQwNC9Menp0ejgwc0NacHIrMlZHbUNoU3EvYnZP?=
 =?utf-8?B?OG13R254RnlEdHkxSWk1Q1B0bWJYaUg1cGo2a1o2YXBWeEk1ZHY4Ri9tZmpw?=
 =?utf-8?B?SWYwbFQwV3JEeTFFbW9OL0Q1TVRlU1gwQkl2WDNJWkZYYTBCOHVXSlV2M1Zt?=
 =?utf-8?B?eUZKb2UydEo3bCt5REVaUDBGUE1SOHBvQ3ltRVc2eHovZEpsSzlMMXNEdnpz?=
 =?utf-8?B?dmt4NTAxb0dnWFNTS0dwbEdIUzRGcFJNbWptaVYwbExERmZGOXJZYlBrK1lZ?=
 =?utf-8?B?QUxobVdOL1YwVnp5S0laYjBJV0xLdHJJcHNhU2s0WjBsY05ubU84Q3NmUDgx?=
 =?utf-8?B?QldXaU5Ya0pCV0NsOG54Ui9aYmdwQ1ZCWXJrZDJ1RWFpa25vd0pSQ2pYaW5w?=
 =?utf-8?B?Y0FFT08zU090UWdSUUR5N0lyWlo3Si96ai9ob09sMmZObEpJb1paelNwYjVL?=
 =?utf-8?B?WURrZ0RuUUx3K0NnT0F2cEpSTmxHaTJhYTNUQlVYOEk1RmRWUUxoUWVCUDJq?=
 =?utf-8?B?OFRvbTM2TUt0SXd2dWppdVNDWlFnWnBGeDQxbXFrR25tcFFveVdjSWpmdU9E?=
 =?utf-8?B?anJ4NTZTVkZHNkd5S2d5S1dTMjRjUmZLOU5PKzVxS1BqdDlJN3RsMHdvMWE1?=
 =?utf-8?B?T1hJYlBTK05nTTgzcDBmYkl4dUc2VlFkSXBSTlFZSDc5NVR6Nmxtd29DbFM4?=
 =?utf-8?B?WWxqNEU5dU5WaHZTWmkvU1ZZazBTd3pXZFl0Qy9LWEtBYjdXUzZsUkdCZE9O?=
 =?utf-8?B?Q3VzVzBSdnJMcXorNkNueXA5MU1LbkROQ1B4QkhaRkN0V0F2dENZTnVNczdr?=
 =?utf-8?B?Z0Qrb29WU0F3eG5lU3ZKbkxsN3BHeDNUVnBjR3VzZ1Y2eVI0OStFa3lKV1pC?=
 =?utf-8?B?RVYzWXNrUSsraHp0dE84WkVvWi94Q1J1STdudXJIVWtoY1VyRDVlWUp4Q1ho?=
 =?utf-8?B?RXRRVm5QVEp5V09sNE5SeTdmS2ZSQzd6VXV6NjUydDNjaFpFNStRV1VldXN0?=
 =?utf-8?B?emNReUdlSE55RWxGQ2cwOXM3UnhpWVdIblVXdWxyYUxyWjNHZ3BNbitmQmtZ?=
 =?utf-8?B?ZnZYMW9IbURwWTRPNnNCZHlLN2p5MDBtSGhiK0xyMTFyK2RkZlU2NjYrLzdN?=
 =?utf-8?B?alVjQXZWbHcyWG1sKzNVL0c5MWVhVDZXRmoyODYzNUk0YnZ5MVhBQmVoMkNG?=
 =?utf-8?B?WS9DT3QzZUZ5eWhXdTZrZUdJWDFOaDdXeCtFNnVvZzRKNXJPSFRyY3JXbWFu?=
 =?utf-8?B?WFJsbktFdDNmQWE1TFRXMzdXUU5LOTExYmRuajBub0E5cllVMHhJWFA0L25z?=
 =?utf-8?B?NnlxOFBlekUwbHR0NWtMVEkzZ3hodnhjUkhTZTNOc1JLZXV4SXA3OFBZMU1L?=
 =?utf-8?B?dG9BNytuSlB6K0ZST3JqMmRTRG10cUUzQ3ZPbjdPeFpHdi9JVHp3N0phd1pN?=
 =?utf-8?B?NXpFRkh5TG9SSG81SlNmK1FIY01tSmI5TG9VTVgyM3d6UGdHQm9KTG84RWVr?=
 =?utf-8?B?bWlKb1pFblZtMFdoVzBuUk5lTks0OHZRZDhWd2hYc1lYTTJFeUpsa1g2VTRD?=
 =?utf-8?B?NEFiYUxzVHphbVpURkFzUzlHVWk4Zk11aU5tOFN1bC9lL3c2czlwMzJnV0Fi?=
 =?utf-8?B?VWpYWVZubC9XdndDSm9Ea01xc0R1R0Y4Mjg1R3MyKzNQMVk0dkM4UG9HLzFl?=
 =?utf-8?B?WUhiaVdZUkYrSHVUd0dXbDJpU2RHdlNoV2JPbDdCYll2SnhrNTRsQT09?=
X-Exchange-RoutingPolicyChecked:
	d95vw0f4aa8DaPekmfAvDFiwAhN6a69o02z+pma9Fllkpj8gLsmlQa8eTcPiVbW4DLjb2T3jzccDbVJKSe4RaEPPOPqmWABvb5wJ0FmJMWNQcCE+CNOkOpUeTzjbccARIQ9/r1B14JhMUUll9+SxxnvA+KTnZ9ma7Ng7m358NbeM69ZfXlYaGEzk/0S2ezMimEoXjKT6oZaSF6nWkRwkbMaNpV1x+hsd/SJUQqQ3O+LfzyOyYtlpBzeOVfH2h3n5u4yzMCalXwpfUBW+6qKttBamyZ9IZYclYWTp02C1Ddy9zJ8A0e6hgaIJ+6s03IdL5YL1N5nMKkOPhm1dQ/84Nw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b10fa2-8539-4593-956f-08df075d06a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 12:40:23.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAkOIzcofvyTvBwgmfzPJ79gNpAR44ymkdoQipFGCvTX2/PtsEZOmqcmChgwpUOfJAACXROBGqYnWlq/ISlnQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5700
X-Proofpoint-ORIG-GUID: 2zSjVneu5X_9ce-QikMQTgNZ8j6JQs4m
X-Proofpoint-GUID: 2zSjVneu5X_9ce-QikMQTgNZ8j6JQs4m
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwOSBTYWx0ZWRfXxLnDtxW48wRe
 N1v4jHZK0y6G5bRT+9yWHeAGc1nPg991d521J9aB9JexY4BcdY2Mkjrh/UtYbDWL8406hHCa4Cd
 MyxvgG2mFlLBcg5QpPutPQSGzet8QYXegTQf2wLTXW3skLpWozLl
X-Authority-Analysis: v=2.4 cv=D4x37PRj c=1 sm=1 tr=0 ts=6a957639 cx=c_pps
 a=s4741YMcG+xsu4HPw1GdWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=dL0ckso7EaYV1oeGENcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwOSBTYWx0ZWRfX394dEL6eQEpy
 jegmOeFtM1zcXwJ/yaZZ5/WT7pLORa8RmZ1vUnLHii2PNr6J1C9MqH7e5mX18DAaAkxYp1IoBAf
 92mEGxzblLUvoK9G3I1yskVbEOLbZPi7lpSLa0ryuLgTSdhY/WUHzd8hOOpZXzPOKynt3kRV64l
 6hRuPQ1G8cwOs8hXtddBlnsH3ewVhiKJhgmL9W3hH6LqTwrjUqUdBGxkBCpFIuyTLHU0wGVMPfY
 PN/Bo5PQXuUE6xneb1y+mrkCbqMBPgOBSp7RdQolNSLJCFR3E/ib7J/zeAwDj82yfbrDlw1yjGy
 Zd8sFS7T+G/caxbC4AkZ047IRfmnfVHCvk+/vcQwUeDsQ8qApbrHieYBuAQDKoKFF+Rz5n4urOx
 WnTX5L7EU63uVbN9jxTBdI20gQ6vz4PBaeeE7Xzt4OS57Q6vQ++Utu/bVbyDUBEv3ByIhuM54e2
 9/koa2Pbme2h81Nceqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310109

On Mon, Aug 31, 2026 at 11:58:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Mismatch between commit message claims and actual function calls.
> --
> 
> commit d65f8f1318d2325009bb83a6877e70b0e20de0ed
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> dmaengine: dw-axi-dmac: Use bus width capability helpers
> 
> This commit updates the dw-axi-dmac driver to advertise supported bus widths
> using capability helpers instead of assigning legacy u32 masks directly.
> 
> > Advertise the supported bus widths through dma_set_src_bus_widths()
> > and dma_set_dst_bus_widths() instead of assigning the legacy u32 masks
> > directly. This keeps the driver using the new bitmap representation
> > while preserving legacy fields during the transition.
> 
> [Severity: Medium]
> Is this description accurate regarding the functions being used?
> 
> The commit message explicitly states that the patch uses
> dma_set_src_bus_widths() and dma_set_dst_bus_widths(), but the actual
> implementation in dw_probe() uses dma_bus_width_set_many():
> 
> > diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> > +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> [ ... ]
> > @@ -1565,8 +1566,13 @@ static int dw_probe(struct platform_device *pdev)
> >  
> >  	/* DMA capabilities */
> >  	dw->dma.max_burst = hdata->axi_rw_burst_len;
> > -	dw->dma.src_addr_widths = AXI_DMA_BUSWIDTHS;
> > -	dw->dma.dst_addr_widths = AXI_DMA_BUSWIDTHS;
> > +	ret = dma_bus_width_set_many(dw->dma.src_bus_widths, buswidths, ARRAY_SIZE(buswidths));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = dma_bus_width_set_many(dw->dma.dst_bus_widths, buswidths, ARRAY_SIZE(buswidths));
> 
> Could the commit message be updated to match the API that is actually called
> in the driver?

Yes! It should!

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com?part=3
