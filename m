Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D394175A8D
	for <dmaengine@vger.kernel.org>; Sat,  5 Sep 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622326; cv=fail; b=EZjWrZ8QvVSdHqsg7AgLFttBOC3TBHhF5CZKGgyM6ljw4DCm85ud6xBSEuWaFX18tD2fKQENlVtFg9qVzPx2gKmADBzCVq3ij4iOYLcmYJHnvp08pGWlTMPvIDOXszof6mEmoTyjC+sRslAmeFOyWo4Raq4x9tgNq/cD15Xp3+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622326; c=relaxed/simple;
	bh=X3s9amMpYJxZsZ+jSbgjU/xO338HXXxtPrF3Y+3DRm4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RLzGfR1z7cifhdugNjqdGh4nn1KwgxHXuc7MO632BCrWU2ddQD64uV/TMGnv0DRnjn/oXfWHCcAZwTROWQ2irIqKBI6b/O1yOsvaV34AlxjOK9klPhcS47ay++qnwY89TzSkZKUaC74Y3OrZclBQRlzdt0IceO1MqZiDTR0yEV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Fy6tR10q; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Fy6tR10q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj5NUzfoi8omavvmiQuPDNKPT/IOlQY7lk4zCNz1h7xI0gVEDljisTzkhqJBTztl1FhoZ21XjtePGZEkwhwhA4jtYSKbBsb4O+THDhbp4gfqpblOd/MNQBXgDdbTQ5YgzIObGdNIRLuS7GyCilA7ZMbrgEdlVIELrbv7EaCPJ4G0F2UdqpPrAOt3fTDGfHJeXS8660U+IzsfyqgfpVqXwNlqwgZX/Tcnh4T9wi66OxqkBsDquzLnSPHG/I20ukfjmYjHtT7wEmTouZu4zGvjsUhb038O4bWf08tRaLdBeyidTk5QeXo62VQY6s7r0WqXPbnLBT/l9MjUHqCSbdi/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrxdOhzq76k+d/6opPOZw++DxsCFY//LYuNU57WbmGY=;
 b=QtDAvePs2Lab97wV6utyuEdKQwDnlbIxmulvqouAn+ZbtZ0Rizkfqna/g8IANFAUFkcXHSwWlEU5k20ZyUYkkfDuXE8a8dfTsHfm3VmFljXOF4Jw36KEayAoK7x7wu4IlDI3A8931eNZ6sd6Np+y54kaHC7zY5MdBn36FXLZU9fKPP3BKceaSgY83VfVoq/MG/I92a38HWVmNgv7I51YiO3OsyeUr7kh0iUnqo3Tq3GtiLeNyjOcHQ9k+L708rZEBhdZiniLpaD/iXJDj3dyEXPAE3lt7+tMifUzIki9E2WRWS3JZSHwB5wbMUM538oGOeeQpQ1b7ZyZSBKOGw3LZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrxdOhzq76k+d/6opPOZw++DxsCFY//LYuNU57WbmGY=;
 b=Fy6tR10qSA9Hmm7pYVIZu49DUyEB42hzUUmBWIUCDgQnOl6BAyaaO7UUMOezcg5HUCcrZlyEfrrpxPuuXEeYkdjFVSfQStixe8xAo6JNhcg1bN3MLI9yg52F+uVoN9maXwsOVrlgaSg7lH0w4VNNuR/XjP4s2Q/XpMOOiJffnFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 15:32:02 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0382.012; Sat, 5 Sep 2026
 15:32:01 +0000
Message-ID: <fe1ff210-3a77-44e9-b092-76995ff3469c@amd.com>
Date: Sat, 5 Sep 2026 21:01:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: zynqmp_dma: drop redundant label
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>
References: <20260903170357.1711462-1-vkoul@kernel.org>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260903170357.1711462-1-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4a77ce-cc66-45a5-7df2-08df0b62d4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NbpdSxp46HuwnJIBgQXxS5YOUa54vEu/r7bYKQrKVS/ppH6SvLv4rYMXvT2CzMJcrA6hJz5uG2OmWIYwbayClx7bbDGzrL7McdW4Mj7lrdYAZBhD72E2D32EO8TRnsF51zejv0JYkyzTHvhuEEBwt8NVUxrqbdkftR1hFgRMTCJdJFlDMb/78jE9c5fLk0m59ZfiJzK/F72dv03BcH+cDzLG0HrOkzC/139OpvLCOqEbPxs/l70X/Rg0XlcqHOil8fzsJp5BAqYrGpsl9Eo0nA2lZhEz3aU5KN4vXPwqSfv3x3ifYDOWVNiG7HPUdCeI2oFIlDLwx+gyAaHfsOfWQLNhq0kSvzlfUKrkQIARIle0bgiGO/JNJ9m33EImu1baTh7fjQCW9+MB5zMXLB+BCLpG14b8NgJmzlT/bRpr2w4UTdJkjL8t74s6k7jRlDc3PtI7MjXkS+NMUeibEgjS0cacPnuHWgcaimlFtAhETvkWTL7iQceeRDVsya2TzRmBFIkwOlNCVVyasH/XU3Kv/FQeQeCItafOql6Fm5+qJmzEwqIZmPAhp9V+KU/a8Q2+bSWsh1VQ+9WUfYjLXjLE03+1uPeEKB6BkIlRHDgrvInbsD7qSPSK9assikB3SdxdThC7RylVe1S2u2u963Ra0CEvTZTjqljQT4V0tWVyizs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d01HQlFWdG9sS2x4dFB1MmY2elkvS3AwQnlPSjFNdXcvMEh2czMwSS90ZVNI?=
 =?utf-8?B?SGQyT1hkT2txcUJpU2k3dzJNMlVzaFZnODg0c0hPMGUycW1JRmJ6NmVjVnZu?=
 =?utf-8?B?UWY2S01nbUFhM0o0UGJDQ2RxRUtGNVlTZURhTk93V1JRbEdJd2ovTjd3ZE96?=
 =?utf-8?B?cnRnVzQvb1ErWmtNVHYvWWw2a3c1bW9uU2VyZXZIWUUvaC90SXpWYzUwS21Q?=
 =?utf-8?B?cFFvL25QT2wvYjh5c2Uvd2FQSUZraDJEQTZqb2VVNC9kUUhFSmlqK3lSVnBa?=
 =?utf-8?B?bnlWVUZmSWN4RmRlVTE3b2ZqdlYrdUxCdWNFb2VDMkQ1ajZ4bkJBTXdaMmZ4?=
 =?utf-8?B?OEhja0dTMDd2V1J1NHBVaDFvcFJIcUY2VGhac1A3bFpuc051d0JiTENMY2ls?=
 =?utf-8?B?M3BpQjdvNWFmTVVKYlJTM3loTXJrNU1DbDRCRXVKRHNuYjN2WkxPTm9ma3Bn?=
 =?utf-8?B?NVovbzlJOUZGL3VTQzN4NGhXeXpMZkFWdnpYTmpNRDlVZzBkT0hSbjZST1RP?=
 =?utf-8?B?bkNKUDM1NFNLaXVPQTZXcEdWTVdlNHdTMEpKcVNxT2lxRkF3N0pXU1BsT2xE?=
 =?utf-8?B?M0UzTDdKdzhVdnlyRmpOdkVGRXc1aE5IYy9xaHdrMjcyWHZ2T3lLMnRkM1g1?=
 =?utf-8?B?b1BWdlRrVDBqOE42YTFiSDVOZ3VaL3RBUkNsd2NrNGdVWXZFckZrL2IzSzQv?=
 =?utf-8?B?aXVHTGxFMVZuWjlrME40a2xOa0lXR2hHd1hWOTVvNkIwcnVKbzNZZGc0SWY3?=
 =?utf-8?B?b05JRjdhSlFGTmVsWDFwdWxhYUVQQVJ4ZnJnK3lkMnhoUzF2akI1TkI0RGtP?=
 =?utf-8?B?bDNwek1scEhLMzJxMkprMkVpUHhTRFhTWTNPK2VHbGZrRC9lQnFCOW9kUTBz?=
 =?utf-8?B?dForTmNuNGpiem40QW9LbmVBVURqa0hsZy9FUSt1YTMwN0p2OFpnU0pOYkVM?=
 =?utf-8?B?WEM0dlVoS1FJMVRjakQvRVlMUnBoZlh0TUUxaUNGUHV5RUVkV1NmYlRvYmtC?=
 =?utf-8?B?VDdYYlIwYmRhVmh2RXlmNXM0d3g4RS90N2RiTGRUZ1creVFFMHZqOGFYZFVx?=
 =?utf-8?B?V045UG1hUVNrazVSR1oyZlFaU2JCL2QyS2gzc2RnNktFZXBhV0hSNE9Ya1ZQ?=
 =?utf-8?B?bDhqWWxtcm03VmR5YUZOWDBDUUlEd3BCUllLMXFNYjM0czFLaWFvK1JKN1ND?=
 =?utf-8?B?aGt5OHVlVXgxZ05raFRKSnlrQnIvQVdKQkJaZXFiVEFjNzRaVkhoOFJzaEZS?=
 =?utf-8?B?MG5BTjE1TFM3WjdHeUxJTzZhdWl1N3I3a0JYY3RCOEJia2lENDZ5dmVqTGZt?=
 =?utf-8?B?dHJpc3NvVkpHS3pKM1pSZjd4VVFaRnpjbWZrWWpHOGloelZxeWJnWFZaT3Bo?=
 =?utf-8?B?dlZNYU9TODBHb0lTaFh5aFdOSitTYy8yVjlIU0JURkdtTm43WDZvOFZPWEYr?=
 =?utf-8?B?eWVYTjZDYXV6N1VuUlMzYzA0c0dza1NZTGN1c2ZJbldXRzZFSnhEV1JnT0VY?=
 =?utf-8?B?S3N0aEtwZ0VqUVNtMUh4UUN5dHV2S0dZbnlNVUhYQ0Z1SDdaQWlGa1AvT2pM?=
 =?utf-8?B?Z3pVZ0pQMUtQdWhKdkcremJqVkJFamRQL2x3Mi9rTmlzR3ZtSTNMNGxRanps?=
 =?utf-8?B?WW1uZFQ0SXVvSWNWbnk1SUcwUkhzM1J3d2V6Vi96bnBMN255YnU1clU5NnBK?=
 =?utf-8?B?bVJiTjJ4dzltaDF6b3MvTGRUTVJQU2ZDTWVYbUxJVXBod1JkSlA1aW55WWV0?=
 =?utf-8?B?Y3R1d0ZvUzZPWmF1bVF6TlkyQWhTb3pHSS83b3ZQa1FsNnFQdm8rcGlDdDVC?=
 =?utf-8?B?K1lVZk1tZE5ud2ZLNkV2UTRUK09sWGs2VFVCVEV2VFdxRmszT3h6MkN5cStM?=
 =?utf-8?B?U05QUFVDbGhaODcvWnFqMFdxMjNRL0JWN3VpaVV1ODBUOXdNMzVhVWJMKzdl?=
 =?utf-8?B?RGQyRjREb280c2JjTE9JdGd3QUczd2VJUVY0TEV6SVdlTEorQ1lLWXorcU03?=
 =?utf-8?B?Z1lhbUZrUVNFQ21HUzE3MUdqSXdGTm04QXZlakpLc2JrcmVmS1dVVlZoRjJh?=
 =?utf-8?B?Um5lcGRLbWNkcWJGSk5zbXAxRTNiWGYyZTBzc3JNVnFOSXpZRlQ1bXpaN05u?=
 =?utf-8?B?ZldjeFA2cE5KU2hFclFjZ0lGaVEvbUd3MW5wOStuV1NrMnpMM21NUHZsK1RE?=
 =?utf-8?B?cTU5SVA4Sm9ZRldaZkhRa3J4Y294bkl5OFJabEdLL3FsNmd3MUhqQnVseVJM?=
 =?utf-8?B?K25FQVFDZHR3WEE2N0NGOEJ0WnRiMWhITnNSV2ZtaFZxT2N5YUJPVnRzT0hE?=
 =?utf-8?Q?OwhftAXVqMxorYVR9H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4a77ce-cc66-45a5-7df2-08df0b62d4a5
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 15:32:01.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wSvAijsuFFuIPb/QXSPaWahr9dWoYs/NVEsBpPMk583MZdheH0PKAkvDVDbrpauP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100

On 9/3/2026 10:33 PM, Vinod Koul wrote:
> Commit 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
> dropped the use of err_disable_pm label causing warning:
> 
> drivers/dma/xilinx/zynqmp_dma.c: In function ‘zynqmp_dma_probe’:
> drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: label ‘err_disable_pm’ defined but not used [-Werror=unused-label]
>   1171 | err_disable_pm:
> 
> Drop it
> 
> Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")

Seems Fixes tag is incorrect.
Fixes: 3f30db282c28 ("dmaengine: zynqmp_dma: Fix chan probe/remove error 
handling")

Rest looks fine to me.
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/dma/xilinx/zynqmp_dma.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index d1ee51dde3d1..3b7dfa53f972 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -1168,7 +1168,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
>   
>   free_chan_resources:
>   	zynqmp_dma_chan_remove(zdev->chan);
> -err_disable_pm:
>   	if (!pm_runtime_enabled(zdev->dev))
>   		zynqmp_dma_runtime_suspend(zdev->dev);
>   	pm_runtime_disable(zdev->dev);

