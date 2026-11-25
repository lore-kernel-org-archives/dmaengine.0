Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795604086;
	b=deDIPzUJUtZNexhOw6V6VdcNg+ehbWMYdSGulLZu7zxSXaj0OYk+xwvUSj/aeQBrKNlL
	 CYnoedgKQL80prHOb5m5VAl/GCd/9W73XwoB7vXMhGn2VMXNUsuV9Xk69mKkKaEb4V3mJ
	 /0nJpinelhGrJpY91V6v3IdcgZxmIYvDjX5BaDIOpYJrChdiWBR0uOVCseJ2m6z+SwBzP
	 PndLpYJnWAHgn/N9SCyV4nASHqImoxpF4MIplPQ3s29nDt/7X/0jrpLuJI09SNAuYjADF
	 37yTHlX2xElnN1h7IUV/KaMwHIxeGyqhYgW0ev74VYIG5lm+r3bflgBapz13c1pQcvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604086;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=kujU563s6561evj2l+Ksui8wXj0n1ivdN4v42t3WYyE=;
	b=Lprd03G/H5xJKiFJh5YOHxZkMZywkHj5N3JOMscdl1ny5uspZNtJWK6cDR4dsOPa/MPE
	 G7SEqKjyfq/arHYqIEY0sv/NhxQTb2NiqiuA3iu5K/YDzyjKsNGKVf3nnUzstXYZe8Ic2
	 ewCzCXdy0csIyKjiilMj+L26J6+zpwxlF7fWxZQ+VrUZDqicKZLk6EgE0XsmRrhrghKik
	 Nx/tdiQQ/mbgGKGyGbxtSK1XawcGL056FNv/pFeD7NffXZyQwa3CDBoRdCcrF28a7/SuU
	 1XxL7eip8BBQb18l97LA3pgGl8SPvJ4Yn+RMMEWrA1WLmdIvdqLXcX4q/3kXy0wzKOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gbw1zNr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.52
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789A606A32D;
	Wed, 25 Nov 2026 10:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5789A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gbw1zNr+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuglVnefrwx8zGj3tQoHJNBY/GKoiL2SDVSJLS0STkDYbV5a7MX143m+IvRrVj/9jibENu6wEUKl8ot4y3wTa9SHV/+Ui0QBLFSmIwb6O9dgYoJXrWqi8ee00TntnI/KhChQDJdWfdvG+5nlJRDdF3Cx6d93lvAok5W9/M4EMdHGyNikkwqlBCdt0n1i9wVpi4+OPoczKI1gXcD8Ffs/YKQUjEjJIb94An02+NlTf1QUcJNr2eL3pNWXaUIpyjTI0b3nIdUY0nAldio5qey/yiZbGmwgPbqX8sWZ1UXTEgxwqCMuTfVcBFgxKV6cNERXShEy60Edu8ssZis8Su1i2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kujU563s6561evj2l+Ksui8wXj0n1ivdN4v42t3WYyE=;
 b=Eg+VI2ScEaDXIy3qvtBu8lBm6SLBT/BORBlrtmSn6u1RRXdPnTc1G3nYbW76Wcyam1nLSfYD3L9UBhXAcrYOAP07pGDu7Wwt2bdR2CiwtJS823ep81NxXuuUjOJswZ3sNbBWOO/9Bb4I6dMCSIOAHA264S8SaeIdY3EVGaryYfHpKGI3iHOa6h3jltVmmvOlU1FKklk6Kis5Qal84uISTUv56BY+Jy+2/1wHvjMIcJD7GVhT76pBsIGI1tq2lUDA9fmFxiQgay6LZmzeT5pyjLlQPJrtdqQ6xcMuijj5x/xc+s4JnGJO5gRLgw4KJsPyZbRsqrO+eqWUaZQ789v92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kujU563s6561evj2l+Ksui8wXj0n1ivdN4v42t3WYyE=;
 b=Gbw1zNr+84dUr0hp4tOExN2ciaYNKcen21OO3zVxWn7V+36tX6kO/0MTEXLc6PNLvfteoKYKX8VQplDuzJEIIMPemLgI/Sq9gHTe+pXgJPJc5wvTdXFuzY0+ZRwtYrcuW/kIvb7cSA7O4BbJY4KyU5QHpnUpqTAAeWX2OU761VPKp602gEmF2Gr4cIRtR+1oHvCCDVUzNP5FG3MVSlzHGbGWyicJLS41idvchGk8JqHoegcbVPSklrqgO0t/N3SSdRUz/1pQ7ANJSpR4+GoZmaK58d2Yn7aDMO1yAO3TzLsruTjWKJj9lRs5KtGu+GZPy82dt466/r+hwM5lpMLfoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by BR2PR04MB007356.eurprd04.prod.outlook.com (2603:10a6:2c8:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 10:54:43 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%7]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 10:54:43 +0000
From: joy.zou@oss.nxp.com
Date: Wed, 25 Nov 2026 18:58:55 +0800
Subject: [PATCH v8 1/5] dmaengine: fsl-edma: use
 devm_clk_get_optional_enabled() for channel clock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-b4-edma-runtime-opt-mo-v8-1-81345a3bfb52@oss.nxp.com>
References: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
In-Reply-To: <20261125-b4-edma-runtime-opt-mo-v8-0-81345a3bfb52@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: Joy Zou <joy.zou@oss.nxp.com>, Frank Li <Frank.Li@kernel.org>, 
 imx@lists.linux.dev, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
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
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|BR2PR04MB007356:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c2d8e8-2549-4c92-7723-08df4ae28329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|18002099003|22082099003|56012099006|11063799006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261026121527099003|10067099003|261026140227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	zFBIdtOg/N/qAzTVJGiccTvMo3f/CNaWxTwvFm63nkYB+5jO7g38vMBXHfJgq2KnbUUj8b7fkT+HhBOwogwWQqHfvVf/D5b0Ze2h4HBeZxORFxteGxC4LlbHPIi0ShYINJiX0M59HDsYFCks47SK7iN6ZrLKjbVMqVOD2k4BFdqyTXdbiKXoixs3CdaasCy12q5gAKnJIOXbzaVLHWVEdA+kUkdgS4cCudn1Kx3XJmvuzdCmx4kCoyd1SNm3L7VG6QaaA/85NYwI1WHnTwe38tCnUy5bdj+g2ay4trivPlHTm8iqad7hyiz3nNqYs6mJV2mzakdP0OziU59a7Pm2IMjk7Gqkp1g0KClqgIFZUMqGTVoGINy+t9c1zjwk9VgrutiecgsA9u/XOeJSmzgbZoHgqnuGCcVM6205DNEize4D5ylLI/QI8/ZMOgenTukA5PZ96GtrEUXIbEmdmLupmfSNA2GTdu3R26tZLpit+24jyNR/mPmrPfJxNbKBqtrdAaefmuhdNDK9qBqnJFs0htqjCC5x/skUEM/G9WB9asMBFdJ8KAEjb7SrIAQPcxKlKdcne5EyfNvji2joJwufcVk+PJZdF3QhgJO4hrCnJE/V2eS7JPbCllrRPi4umtW/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261026121527099003)(10067099003)(261026140227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anI4aGlxcTRBdFlDV1EzdUZTVEd3YWs0cjZxVXc2bFFrMU9uZUNpWndNTmFz?=
 =?utf-8?B?elJ4WVpGR3d5M1NWUFk1U0cxdlArWTBiaVRiMUhPd254OHlEcWp2ekhNMkc2?=
 =?utf-8?B?anhoaFpNRW45ZkdpN0phNDNhMlFqcmc0ZUxCWFlKSVlDUmIvTm1DRWdXd3I4?=
 =?utf-8?B?enVyWDVGT3hmL0ExSzRtcWE2WTdwYmVXdlVCWVZyTmxEZk10UlV6QWhKaUcw?=
 =?utf-8?B?NTRwSHVUWkVRMFJJZzVXRUJ1c01Ud004TkFxUkROZ1c0YmdHaTg4cEwwVEZk?=
 =?utf-8?B?TXhiMGxwRVpkMGxNcjVWaXVwUVlSb2NlRVRtMENtbnYxYjdCSkZpSmJwSEpD?=
 =?utf-8?B?dEVRRzVhNnVQNktnekI4TWFZclBMUVVYS0ViNDhHeUZNbWJmbUNZbzVacHlY?=
 =?utf-8?B?WkdEVUJ6Q0FmT3RORm5Ta0crYkIvdFJqSUg1S2NlaEgzVXV2YzVadko1ZVZs?=
 =?utf-8?B?R0hSYW92VndJbmFvK3puR3pLOXNJSVpWQmVEeFZXVWdYOFdJRmRWTGxVRkt5?=
 =?utf-8?B?Ui9oZGR2V0o2VEZhVnIyajZuaEg3bUJTenpDWndac0gxeXpId29IcEJRaVRK?=
 =?utf-8?B?cU5US21DU0phU1lKNFZKM085RldPUE5Damp0cEs4TkNCaENYcFBvQVJLcitY?=
 =?utf-8?B?V0REdVFIZTVrL2lXODNhckZ5ZG1xSnE5dXo5TkVsdXdicmE3N05PaDcyZlNi?=
 =?utf-8?B?MEdwQXRQL01yVGgrWWlVTFA3M1M0UGtrN21SQXlzd1p0eVhtL2xkSWVzdHQx?=
 =?utf-8?B?bmZLRHhzZU9VSEV0YmlIWmYwbnR0Um55elpDLzFGK2xZbmZwb3pnK0RvRG9n?=
 =?utf-8?B?TTNySVNZb1ZSZHRUei93V2x4U3ZhNHQweTlBZjcvYTQ2TmtUV0FISGRWR21l?=
 =?utf-8?B?YzNzS1pUMXAvV1k1WkYvU00ybkZGN29pS2l1bTM0dXBicWtRenc5UTAzdkxi?=
 =?utf-8?B?bVFrUHlDdVlSS2J2Vk5LN3BralVjUkNWUnR3R203UVhxMUMzS2tSWWdzYU9y?=
 =?utf-8?B?V3JxK3J0cmZnQ2RRcDVoeGl0ZWRiMUZPUDdpMi9SZ2ZMTzZ6UlhoaTFtWVRh?=
 =?utf-8?B?WXVISHMxVTRTVURxZzZTczVaVWJkejFJeWpSdm94VzhjanJxNUkwWlNOUW1u?=
 =?utf-8?B?RUdMc3V5a3NDMERGNWhnTms3eS9qbEZiRC9nOUQzWVpOeE5jbGhCREpZT2xv?=
 =?utf-8?B?ejBLNk9FQ1gyTDVlWXkwTlV3OFIxK1dFWFFTZ1NpUEI2ejdobUYydTdla2Jv?=
 =?utf-8?B?MDJBQWdIdnR3aVZyVFFkb1gwT25oR011dDJGVHdMak9xWittWVliWC9GQkdm?=
 =?utf-8?B?Z2RDdktzUVhuei9nbkFwekFOejRMclozTDBhaklQcXNvN1ZkRHduc2VyK3dT?=
 =?utf-8?B?dFQ1cFpNeGJjSGZNeHRDTUhuem5ISG1ubkFILzhaaUxyRUFSYnVBcFFxNXdC?=
 =?utf-8?B?WExSSkZGQ0FXNUkzUG1MUm56ZDFWa2VtemlFaHpvMU9iZ1dzUjUvSHpVSyt3?=
 =?utf-8?B?TUVGR054QUIzODJUSVRkZ01YVGgwVU5vaWN4NDJHZUNpbzlEcUhXVmxPanpG?=
 =?utf-8?B?SVd0TmlZWEQxRW1FUFRnN0RLZFdhZVNjZUhFbkF6MGV2MGNhMjVlTy9HbGdE?=
 =?utf-8?B?L05LOWJZWVJjSlc5cEJad1R5UDBlWkNUdEIyTG81WXQwdHhkWlBUeUFoOXM4?=
 =?utf-8?B?WXUxaFdlNUlGd3Z2YituMjlQOG1OeGdkZXE2SkxLcjdtOVYwcHJFd3ZSZWd5?=
 =?utf-8?B?YU53V0crbitXT0ZCaEpQVXVOaDhxaFZ3UFBTM1VlSm9RRUdGajIwUGVzT0tC?=
 =?utf-8?B?aHh1T0FPM0pCTzB3V2RiSTZYdmZ0TW1YVU5zUkhGVUVnZnRzQ014Z0FrSkNh?=
 =?utf-8?B?YW03cDJZMVdQa3V6ejErR3hNV1BXK01ySFFWL2RrcUMvMVMxakR6S0p2bHNq?=
 =?utf-8?B?emdMOUk2ZXhKNEcyZlZpR1ZpWG1ZUU1ycHFhMjhTWjFpOHg3Ty9Sc0ZsekhF?=
 =?utf-8?B?a2xJTmM5NUI4MzVpa3AwMHlaYnkxUFhyUU1FeDZ2eXFGSmU3TjBjTTkxMkJu?=
 =?utf-8?B?czAxb2p0TGlRLzNvdDREc0EvMGMyRHRZZ0h1UExNTFRlb1ppT3p4SVUrVjJU?=
 =?utf-8?B?RzJocnJtT3dzSTBka3htZUxxR2VMaGMvY09yQWgxWWNmeDRlR1BjSHBSRmpy?=
 =?utf-8?B?VVVFa1RvbGdDYjk0N1d5S1g0Ny90aUQwc1B4L3VLQ1R0TDZOVHNrRnN2TllD?=
 =?utf-8?B?Z1NMcXoxMG1uNCtPV2FnSmJUdzV1Y3VFcisyRU4yVDdyZkRyQ3J2TjdlaDNH?=
 =?utf-8?B?ZUs4bnhjYVRUZlIyNjEwMWUyUGNteUxtNitHbFNFSEFQQ201YXZXbWo2SDUx?=
 =?utf-8?Q?pOIV0El5nt3NK/HtDTKlKOMht4oOflJiOvzwV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c2d8e8-2549-4c92-7723-08df4ae28329
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:54:43.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehjwMxB8Lc2MEviZlb8yAV785TU3pyYjn3hBAQYDE9ODt9icnPvBkBLn5Mc11thk8Bzw0WYrUrQ2lSTgoeYEg2K7Lvo7S3u7IAOb12xyRQBukKrwpuhFIKho0vS0Ecb2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB007356

From: Joy Zou <joy.zou@nxp.com>

The channel clock is optional and not present on all platforms.
Replace devm_clk_get_enabled() with devm_clk_get_optional_enabled(),
and remove FSL_EDMA_DRV_HAS_CHCLK flag to simplify clock handling.

Prepare to add channel runtime pm support.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes for v8:
- Deleting clk_disable_unprepare(fsl_chan->clk) avoids a double-disable
  warning, However, the clock stays on and won't be turned off until
  driver removed, which increases power consumption.

Changes for v7:
- Replace devm_clk_get_optional() with devm_clk_get_optional_enable().

Changes for v6:
- Replace devm_clk_get_optional_enable() with devm_clk_get_optional()
   and devm_clk_prepare_enable() in order to use runtime PM for power
   management later.
- Modify the commit message.
- Add Reviewed-by tag.
- Link to v5: https://lore.kernel.org/imx/20260513-b4-b4-edma-runtime-opt-v5-0-1e595bfb8423@nxp.com/
---
 drivers/dma/fsl-edma-common.c |  4 +---
 drivers/dma/fsl-edma-common.h |  1 -
 drivers/dma/fsl-edma-main.c   | 18 +++++-------------
 3 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be2..4f7a942673eb 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -1087,9 +1087,7 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
 	int ret = 0;
 
-	if (fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_HAS_CHCLK)
-		clk_prepare_enable(fsl_chan->clk);
-
+	clk_prepare_enable(fsl_chan->clk);
 	fsl_chan->tcd_pool = dma_pool_create("tcd_pool", chan->device->dev,
 				fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_TCD64 ?
 				sizeof(struct fsl_edma_hw_tcd64) : sizeof(struct fsl_edma_hw_tcd),
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index cbb077e98f55..4332b2b2e1df 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -213,7 +213,6 @@ struct fsl_edma_desc {
 #define FSL_EDMA_DRV_WRAP_IO		BIT(3)
 #define FSL_EDMA_DRV_EDMA64		BIT(4)
 #define FSL_EDMA_DRV_HAS_PD		BIT(5)
-#define FSL_EDMA_DRV_HAS_CHCLK		BIT(6)
 #define FSL_EDMA_DRV_HAS_CHMUX		BIT(7)
 #define FSL_EDMA_DRV_MEM_REMOTE		BIT(8)
 /* control and status register is in tcd address space, edma3 reg layout */
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 630285c85482..f0930895d7e0 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -572,8 +572,7 @@ static struct fsl_edma_drvdata imx8qm_data = {
 };
 
 static struct fsl_edma_drvdata imx8ulp_data = {
-	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_CHCLK | FSL_EDMA_DRV_HAS_DMACLK |
-		 FSL_EDMA_DRV_EDMA3,
+	.flags = FSL_EDMA_DRV_HAS_CHMUX | FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_EDMA3,
 	.chreg_space_sz = 0x10000,
 	.chreg_off = 0x10000,
 	.mux_off = 0x10000 + offsetof(struct fsl_edma3_ch_reg, ch_mux),
@@ -813,22 +812,15 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_chan->tcd = fsl_edma->membase
 				+ i * drvdata->chreg_space_sz + drvdata->chreg_off + len;
 		fsl_chan->mux_addr = fsl_edma->membase + drvdata->mux_off + i * drvdata->mux_skip;
-
-		if (drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK) {
-			snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
-			fsl_chan->clk = devm_clk_get_enabled(&pdev->dev,
-							     (const char *)clk_name);
-
-			if (IS_ERR(fsl_chan->clk))
-				return PTR_ERR(fsl_chan->clk);
-		}
+		snprintf(clk_name, sizeof(clk_name), "ch%02d", i);
+		fsl_chan->clk = devm_clk_get_optional_enabled(&pdev->dev, (const char *)clk_name);
+		if (IS_ERR(fsl_chan->clk))
+			return PTR_ERR(fsl_chan->clk);
 		fsl_chan->pdev = pdev;
 		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
 
 		edma_write_tcdreg(fsl_chan, cpu_to_le32(0), csr);
 		fsl_edma_chan_mux(fsl_chan, 0, false);
-		if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_HAS_CHCLK)
-			clk_disable_unprepare(fsl_chan->clk);
 	}
 
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);

-- 
2.34.1

