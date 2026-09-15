Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8DE4A8A0C;
	Tue, 15 Sep 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490073; cv=fail; b=cX3n8TUV5rOCHci0G1ppMSIaVKRfsawU6alHq0zhNmKzDVaY7mD36HZXW8WMQRyzVUgC0AIB48O2DkcQaLD6khhjXcImCVeg2eqc6xGc0dPq4ue0WKoBpw4Ohcz7b9Qc3DeJ1Gm87mLubE/M1Tyle+i5asWq2TkflAJpvjJPimc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490073; c=relaxed/simple;
	bh=QvSeaZeE6HSSfL+tp95pEWrOLeoaGgEBOO6k+sRVn4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tkmROAUpqsCt/Gtr28avII6OgoiVAXyq7/W82+39BaQ13o8j3emTkY2WBUoby3Njp3FwLHChoX0TH+0SDrxDprQC07KpO37FBgOSedeC8cQk8NTssUBD/LuftxFXpUecytWKwruTf7hCfYZim7/5hWtyfUYlp8ZjHxhm4ULRpyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AEmyFt1W; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AEmyFt1W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkyNP7uGW5UNSec7S7Gf/QNiCVajoZ1WE0qW7UDEj4NNW3B/3bJImQbyWx5+VR6xOYWsgkuD5rp6TZTZZVPLJV8SVwEnKjRMJHkdAcToHPx4zK+TAN8gIMV88Gx2+jtw9lSFtuLh0y9MwN6b2ftQafP3jpdN7DDTh6mjIjxZBf3PE/aV4u7iU6PWJZuIAwNVOxxXTedpuo5oU5bZ1V5WjtonlF6qXFllglBQsCMuWB6EJ23ixGNrCpMWtxcPnfPp+ANKBvmkqpn1Yy7GdnFAeYA3Vp66RKUcuSSkhbXFZ5oL/BjnYl/RSi0wmR0lAEQh3HipjyFuuhZ9KrGZyxYfUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cm3KQGdgaluthvvb/TTHUgWa+xu4SalMw/jRcgsJx6A=;
 b=cIPpOXOamtPasHB7TaHotKu8RSD6Y/IMx3GxjBHlmJ7YCxQs6+U0nm4qT8mtR5U5HM2JuynNQBC3EOf9y9VD+UUDWV7xLKqSN8hhjRRdyfNpYV/TgIZavQRcstUgpdy1fN7tHZAZJaTqaJxgyeHFzrOIrZSDSyd6OSAZgDCHl1cs2TJkEmkGA5avZo1maH8y6QbYH3+aSa57HT1TB7A1sDT7N9b4EfiqvVVrPp+HDB8Bq8eOJpScJ38laUr5QlWYFIFbfnK0EJqMLOBZpFHBgNICaT0uLcIBLtPoKR3ChnAArNoHBMXh5oUaPEitJdx1HhPQspP8qBAfCSgA3+nSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cm3KQGdgaluthvvb/TTHUgWa+xu4SalMw/jRcgsJx6A=;
 b=AEmyFt1Wgo8szdIjW6cnKwDuQNXJ+cmh3SM6VNLIbDHQd29L5mFNwMKkKLnK56E5IM63cBU3w5s/B9DotndQvA4h0wsweojR8W5LCy6Ptl7ay+/1b13GRTeXhj5wQxF0mvlXGOw08VZkn9WpRdmmAy6CdLo0YUWNEK7COPIfCWudFNcFawbYly+6A7cSE8WElIlXBdmZ6BSSi8HIYVCwGQAMgq+rYdxKSZ/KTZnB8DuLnk9pEouUwC48zZ7LUKemWk315TtgBFVgJHeUadEojSRyVIbxIO+iv7YUGmDjJmiy3LNX+nabowerFqKYETcQQSZgVIy7+abS1KYhPmTc7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8679.eurprd04.prod.outlook.com (2603:10a6:10:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:34:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 16:34:28 +0000
Date: Tue, 15 Sep 2026 12:34:21 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dma: qcom: use named initializers for
 acpi_device_id
Message-ID: <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk>
X-ClientProxiedBy: CY5P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ed::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: cafdc498-b527-4b70-747f-08df13473663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SYQJyyQlTYIUz26XxE64x6UdrqViMavClTqLo10v+ZIXJXOWax57f+UMF+2QCo8NSHcY0e1ZJBEJxvLHug/zk+2wntZb0VeKGV8Oa97LsqFXcS0QOAKcuwaUmCh1F5+AfAoSb6cCZpvblDW7vl8yXHzz/xBzc4S7FruuVEwB/EdjtiLh5jMJ8M3FHNupreWVIjOQbnGHEZtd5FQJfAXvozb+B5lMTx/u/8Ghnl3b6+ucUew5yq47VU9qLXOYppllC0WWiEtKsqo/RudPttNp9gBwCGVxZxJOhQ0D5CiLH65s2jK3WnV9g+30oTe4lpblhwaZXe+joCv0uP8Q7jXYNQgbqSZ/vBu9GO4Bmih+3THQZm1x5h27MabE5plYqzBNNKvs4KnNSh6F6wgS4Pt1lUQd3yhN2RPvWxpXHHG3bQ+jBi39PQWvyzVzjyJPYaJIXDldTdlwKNh6pNUY1XWkbTNLplWCE1SomrmZ2sxI4VMekuH5VQeNJlYdQbEwUt+6RnqwhTjfFdh6nAby184uhDMdLhXEbzEKYf3sJJvqig26rf3P7TdLb0zY8kUi9GVlbWWxiplJuj/Ff4aTH+PIH4KFNAyVi9K4BPR85Ajix1BX7lCvrlzAVq7264R3G29nc/TNeqjweTgjO1j3divczUna+fKlneR7LcF+PGFhqzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?db4sepwYu3ZQeqzRXeQ/k5ux/iZ7DhmHqsP+jvZxjcHf0u8hTTwkQPHiaR6w?=
 =?us-ascii?Q?2PNkyx2T0z/w6a66LDQXZ1jAAMBTLD+ZwwioBAvPsv4SHaqIzouLIx+6TKtx?=
 =?us-ascii?Q?jaG9rMjsEeWMD5oUg0K4fuOpWJLWEssOkGsFtjPJu1FrLd841jpKjJx/u6lC?=
 =?us-ascii?Q?NO9BcnKVL7S3zoLcFn0u7y4GrfMJxJqF3V9cIVpnVBb6w/x6Xd1DVWadfJrJ?=
 =?us-ascii?Q?D450gGaA1fsj+6Z+xNX/1f3sNFrCPeEV5U2HvEtw4fI7zHe7l3orc/KGytgy?=
 =?us-ascii?Q?7L6TjCqks5KajIQwUQkAVIpzVXVY+er5DQ5OiaJBlDjDn18o6HFTQM5YtvVC?=
 =?us-ascii?Q?QvJ++/M0KhY8SzT5OD7xl/ltfEAxqd/ZLSTRPjFdHWi3RtInZEhR1Vh6WDZB?=
 =?us-ascii?Q?265QVyf6+s0ZCQgVXEPSabD3BZNoiXVl9mtBY58Cll70PImLg07qEfDunxaz?=
 =?us-ascii?Q?Z5UlIWkMB31wfARuoSeTRHhonsNIWBukk5/PZx6QgRWnWRx/SxG7Urhif8hp?=
 =?us-ascii?Q?0R92IJS1oJNG7mq8r4A/bs2ywJW9OGGuZoMn9gIGtokStVr45meApWtEI58Z?=
 =?us-ascii?Q?PVtXeNnusfVWnLGDKTpzBQIXOqz1mBMk8IPwdFUseZ+gLiCDNqIrSyq6yiHQ?=
 =?us-ascii?Q?jD2KhxL+5bMROykCwzMZexhnwCdkFD+cq+Kp/Lzcj1fY0RLMeRjFTXp0aF2N?=
 =?us-ascii?Q?UILrkcq81hZ+P2Ju78oNX7IxjMAFRVxpR+bmv6JfqQJpn33zURYCdJDhmR7O?=
 =?us-ascii?Q?oGukjcFNnE0yInye+X33VagSYJHBjoi8VVrp1ZrIAZQxC63miyjSlmBGKNG3?=
 =?us-ascii?Q?XiQvD+CLgeyzAonYdmPrpTapSY6nPC9erGhMAqXGexvDHS4hoGR1Ry5tAzBP?=
 =?us-ascii?Q?4DewxS/QwT/pXi241DZ2aq8Q/V6jh5f/q+U2EdFV1GAGww/8hxOPGznteJr6?=
 =?us-ascii?Q?zGcHa54bZT6LTpiinkfHePOi83R9tjyuBcTy8ZboqgrSeRqK0h5dCpn8jVOl?=
 =?us-ascii?Q?3suSMsqCnrZ8pGBtTW4G79LlKtgoEsHP7Z7IETW5NAXaIyO5B20l3pFoROwf?=
 =?us-ascii?Q?tgpfHv3IGKnm1/gfDFROsOiQMhPEBmgAj+Xk4bq1b+6Ifa4PW1Z+Hr/Zyduy?=
 =?us-ascii?Q?J76pAi077QYPGvaotcPY3v6/IDGoZf3FTJkVlG8XTyUWn7QKfsfyE1G8xihr?=
 =?us-ascii?Q?y5YDw6wvCe8JxJm6KksFkM+cysTK7rY5oMXsYsrQrfZ4Xxewwee26PPrzz2L?=
 =?us-ascii?Q?Xns8ogc9NI/eJWH1jlx8rFayzrVZNnFKNBIbnRW+BIKUumzVXoBG3yIX7/Z2?=
 =?us-ascii?Q?B+8+NIIFapXYyJ9p02aK+1KfLdnfbtiP5QiqpoHdh2X6SAmC79frY1F1oMd+?=
 =?us-ascii?Q?zk9AuYIvKXDjCShZ5sW3nJg6++Jh9C4Cqfvo2y1XCgu9+PENVOWKWQPjzV7E?=
 =?us-ascii?Q?8PYB5WER/r5699ZPBj1F9V78alyZ4xQyFvwmUDt29zBy5cVPoxgNOgsXEtkd?=
 =?us-ascii?Q?393QoGORMMXWrjRU5L7zi9lTIJ9SvKyZtK4vxY0mxXE3Lg6RaPwpqcpadFxP?=
 =?us-ascii?Q?bzrQ6KcJZfbrboSKyQsaJoq+J5lbF6Fj2/UWfvi/C98usX2xDqCaN6As809L?=
 =?us-ascii?Q?FTVyd9C00Uv2rFRh8g7y4ksQHgolLS55ODo87BRupzd4kM8T11kiqVjVSdTu?=
 =?us-ascii?Q?JjlfkGB1kV1Ba4LkQBmKasj4XEPPXOo14fpg4Qvbb9/GZUnE/rbjNCAyYO0O?=
 =?us-ascii?Q?0P0rgUZhJEzLV5MSwN4lhxonSSSk41vABe6J1moN2UqpZZWyCx73?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafdc498-b527-4b70-747f-08df13473663
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:34:28.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MLhyXCdGPTsdQfXidZuU0D80cnZ0BfzhPbIe8e2LGrGul8411vp+V7QqzOvOQeR96bR6sWizCOpNbfgkALXkwRx8XI0fh7VZXMNSNvcWgO0pw8LmVvSFZivzKfCCfFr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8679

On Mon, Sep 07, 2026 at 04:17:45PM +0100, Pawel Zalewski wrote:

Please update subject, correct tag is dmaengine

dmaengine: qcom: ....

Frank

> Use a named initializer for the acpi_device_id fields which makes the code
> more readable and consistent with how lists are initialized in the rest of
> the kernel code base.
>
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/dma/qcom/hidma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
> index c939635be21d..1349066b1544 100644
> --- a/drivers/dma/qcom/hidma.c
> +++ b/drivers/dma/qcom/hidma.c
> @@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
>
>  #if IS_ENABLED(CONFIG_ACPI)
>  static const struct acpi_device_id hidma_acpi_ids[] = {
> -	{"QCOM8061"},
> -	{"QCOM8062", HIDMA_MSI_CAP},
> -	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
> -	{},
> +	{ .id = "QCOM8061" },
> +	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
> +	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
>  #endif
>
> --
> 2.43.0
>
