Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020132.outbound.protection.outlook.com [52.101.229.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E278414A1E;
	Tue, 21 Jul 2026 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615430; cv=fail; b=pcHIbvGxiGrXmP432vO9GqoAKYNipyBBBKQTJ/w9BlVpoA49wjI2h+M+srrvevUW5DxGMqS0NSdADMZB3Y6S3nlm7uyCKytiWu+R6yJgrRI9Reu+uqskYiNWQhyPYjjrw+rQkiXfafQLaSzz1DhzqOWYaI25qm5CvI4rHoHpY0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615430; c=relaxed/simple;
	bh=ME2+unJNHAax/IZ8ANoSLg5xUyUIsB9oV1SSlGQbwM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tG57qTUwBj4yOrcwiIztOfJkWONJ1pNBatv436wrZ6Fxsv4U/QVZ9eLJsHTXqJf+4kZLtDcZJb+vkAvQMLcdd+Uh+w1aG6peOEilMWZJ5vVftd6OjVNDCDyTAtSDnGvqJFDBR2j2ElYiACCR6AQ7R6Sny1PiTwyhrnXW7v7zIRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=vB4vHZJn; arc=fail smtp.client-ip=52.101.229.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="vB4vHZJn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct9Roqmuue/TK0z6nS77mnnCLNiRm5Tit9H3H1veYR9lvj1BEiaq2x4Ccx5/QRwq0vmOZmRi7c0P5OTubnxDZFYj7tPFvJIUG5RLC1pwdYtGoLW7Y17zxtHWVziFiI2zCZP/WnRn4l0C4V9223eFNwV4kHQEVPGeZSian6snq0YX4gZifhsupH9CfIGArMfR2rdJPnhcwy7/quvHrbBLO43S5ZG0FLPDdBnCC/uv1rru/soyI/qtfIUQ/ZJPM6vIlZmBFer2tBdxBBCgyROM1J6L/2zM/YjcPLl8l94UrFX63ovsfPSIGoKbOrtd4g4vJkYYzuF/Pn2tx5IHjo6Qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzXZD9psFC6KvZLdZYUxBL8Wo9z+kqTfRjByCN10ib0=;
 b=Gbh/N8AheQN4gLqurnHIYIrJNEZp+GkLf0ETid9EW+h9xbPF8D+VxFaqZEK9yeAWOQyYO4cT0uv6SpgpqgQvgNkqZIBQYTvIexJdtI95Qj/JBr/CM1eijTUrZi7XIrXYxVrOX+dIWfaoAHdWExDdpt3EoDap2HSegV5Tbw1CxQofTyffVa07HhukDaQIJ08RszBauoGjQF0h4NlAfiBAd/uCdLybtDFWZMM5PgGxui+/BdFh2YXwe5NKPCMcH1SLJJh6BWJMoheC+993NbBYwVzEr3MXeA3tlrreIv8uKjZsrHJ+CjghD59CcBcSECbEE650QTaJHzNMbwdREsntmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzXZD9psFC6KvZLdZYUxBL8Wo9z+kqTfRjByCN10ib0=;
 b=vB4vHZJntan40Y5GnDq2NO0um2BTda2RsHR/Gu68zL3UehyG6a5Ps5SKU+ckZvrTv+27EukbWWTX0leKfEZ5XMwOnMcXTRmeTyrCTcbFCfkYeVIOOYxD1LOuQloLJQqCDBKHsJXfVo3xTkL+ioalRVw0o5pO7ncT/cGEI8oFH74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB4382.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 06:30:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:30:26 +0000
Date: Tue, 21 Jul 2026 15:30:25 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA
 (part 1/3)
Message-ID: <qv4rrdstxrhlky3sh7mgaitdispc4eesas3km3xghzciowtq33@adpqgjfsbiv4>
References: <20260717050308.2144108-1-den@valinux.co.jp>
 <alofV2-d8v7DWkk3@vaman>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alofV2-d8v7DWkk3@vaman>
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e530c4-c9ff-44ab-0971-08dee6f18d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|4143699003|56012099006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0EYMsrL75J07z8LnL6MWwHA+pq5qpYNZWFHPe3Ab/Qvrvot4eSxl2S2xDLQ3ZpBfdxUTt5FGGcLXXzs6M8It5qEiWK/61pgbeeAZNVB61T766y8ISUqbwIkBmrvQsLfDMURMDHJKhTlHZ3C7ZtMVOR/vlpqTZmnVGf87RseuP01JjZM9UImi2DZVZYzJoNYY6LD52hlIBBoagLflOwdfLFaWG7gFW7ap4Ry6Xdu9qevObsAEx7qpt2/P0QHBQYs1LeMWI6ID0CWulgJqrzMDj6LjzBrTQfbRPphvf94EcYpAYGAOQOuIi3qItAXrNPWMhGDWcy2YUmymwoW4G3qKF8ihGXfgfSejOYrFjY/jvse0WPC1TEG69wAqFrT9VPddzihzSQd3/qzIu5OK6eiHqhAkhF+1r2A/Z09BJm4xlNFvTboCImE1jQBymkyYL3DPb86ghdlIBAwzMp+GGFZN9E5YAmxspHUvbViWuMyoua5J9qpVK7EcEm4mp5vix4za/qM00xtmBpj+D4rQ2TFDanP+w8apQpfIKIm6iruh3d8e0lvvFEhAa3sFhqTISIxwPYrpNbztFrBiO5fwaiMORa7MZw6lxjm75e6/o5/i1UTKaCfDpY+1/NiM3hsX+yzoJZaVRwWgj7QMYR9/smV+mprLmZoMhTypSdO31WNPMTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(4143699003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fuCtt8BR9mBK2kiEoX2HTp2pH4/dk/a5kpk1e2N8L38aEfRU9VIrHXCuHjyE?=
 =?us-ascii?Q?cJB73Tu+W34nhkyL30yG4qC+mxgW17fNHYgs0jX9Ok3SiVAWXxpOmONMQfDP?=
 =?us-ascii?Q?Pl3RvV9PuNKDz/1ecz44i0sKa4D5txFGgkeu6nw6bb+7QPNjID5hKiglMPyR?=
 =?us-ascii?Q?QP6O34zI3510QmITWJ5G3K6LHOxZd67jQGJFBeJmlnsQSklw9yysd7tVhvNn?=
 =?us-ascii?Q?eYAapSkM7sFe08AohibOfmto+VS+0Q1Fp8EJp3rKPcD/R/68i2HhWimtsoq9?=
 =?us-ascii?Q?oO0iVgf9sLhGiuKBVx2xCNZ1x2O5/bn+sUtFFHDm/4y6p+w1CpRK9l8G4H1B?=
 =?us-ascii?Q?YMLdq6SE0OnqmRUqslcna9Te4hyOkkYVGpd4aVZrumPwCoaLjFliwv+LBPZ2?=
 =?us-ascii?Q?o7gfkhLpI3zRSRFA4YcxVeDqJO0swUz38jxEkvSQzMcNSbppULGQUX9tYHlf?=
 =?us-ascii?Q?pFEJfVMFiuNvnDizXmwV0msM8CkXbbg0sD5pp8LphRoEt4JIw0wdhtmPwVQA?=
 =?us-ascii?Q?Vu8w+mS2nEq156a6ekjKTaLqZpiBCZ5f1QOjr57r+Xp7ylp6ku0rcdJW2AVn?=
 =?us-ascii?Q?/PJHOpwZFg5+8Pwa0gNVxQTWmGw5SRtgOfcFX+hlak3fA7rr7S9+fHmOAc7i?=
 =?us-ascii?Q?CA0Hrg6nxeEpJWHuiIq/kyDYL6UkGBk99kvQONOsgp/vwaWNvj+NiLr0/4pd?=
 =?us-ascii?Q?MKX7Y1Rny0cwZVhOFrFbZFgM8tnBfeS52jztMfQOefXWiXc4vDvlRXrwMaaT?=
 =?us-ascii?Q?fKkS8xeKsJzzbJ3emGyMLi3I8ZJFKHyttGicpI/r9OrVEQ7icqhOR06fPUPA?=
 =?us-ascii?Q?kv0SwtMowOeiV0MQjYKdTivl0mQ8RDxOjWVn3/ovE9/eNbW1t5hYVQ4I95NY?=
 =?us-ascii?Q?4Y9DG7G6JgbFZfrrq83O5hFu1j64LZkPhIf8SMMph4DxwkLinRy8DNzY6PL8?=
 =?us-ascii?Q?8tUQq4P9HtSXgrMf3cYP8qzSZboMa6fvLxfEunfSfrkKfAUMHAh0aJezHGCA?=
 =?us-ascii?Q?S1nG1lOJabZF/BieT6Hd9uxTdWINMNuO427GzQ7OecFdkNXsvrCLdTyfpvuX?=
 =?us-ascii?Q?gKiYpLXfuWhSSbA3Zl4cILa+ZRw7sNZzLjSMesi0D+K9N5eT8VfwuDWMAjTn?=
 =?us-ascii?Q?dsxXiGHvX5PGXslUbRT8ZeYeAHkzUfiGE5iPjxB7EVe0HRLYUKV+LS4ZApdB?=
 =?us-ascii?Q?sMLKpqZaeOnz28aGAUnRAzUTzPoZp9nYH2GDjp3//zLttfmIOoFJBMxKbTeJ?=
 =?us-ascii?Q?IrfSyFkPdLHyEY0y7wrkvY4kZS0zPmObUiDgCmPWM6nRNHt6TwpsDrPbX/YM?=
 =?us-ascii?Q?v5iqB4rAMgioGhQmNpr5vWOMR4p+L0uCh6mNfLuCCrA1iNxzHP/vNsGEDGDZ?=
 =?us-ascii?Q?9zZBC92prpd3NjYK2LCnR2dfNgEBMRHnmrJbBIBiSZVsHObY9RnYMM41dgz7?=
 =?us-ascii?Q?BTc1Qr0CliNhHeG9JKXnudyi6860KPP4n5Fl3/K1Yu1w6TcTBYFwVOCUIXcG?=
 =?us-ascii?Q?wgH0NB0DWcx+YZCA3S7jUp0gswPGVYRg6MgG2Zdg3XelyvkTEtM+MWMnY13t?=
 =?us-ascii?Q?oHuMIrcwmudtVIglHNb+hp/8serbxsjLVOq/wxRwRlnBsSMMt71+YOlGTBgZ?=
 =?us-ascii?Q?94YUJUkzX44YajkI8O7v6Mg8c48vJsCM0/mu52wgL9PXcCJHPYymYPnD/2MO?=
 =?us-ascii?Q?sqnTvoCz1V8shCFv2m250zuDNSpDen28xiTXbFnri0PsPXzaQ0N9hgvpz2Cw?=
 =?us-ascii?Q?rR/V9p71UOv+m/YqDq15QrSbZnX5Y2Bm1/9JPf9mQFyZ/xPYBCO5?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e530c4-c9ff-44ab-0971-08dee6f18d16
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:30:26.2833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfWhsc9K54+7HkfPyEggaR+diKqFZqJ1UH8yYDM0rsKTcv/8/mkeFVQSy4/gauOLK4OZQWQaF1QXzn+zOb90ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4382

On Fri, Jul 17, 2026 at 05:55:59PM +0530, Vinod Koul wrote:
> On 17-07-26, 14:02, Koichiro Den wrote:
> > Hi,
> > 
> > This is v5, part 1 of three series for PCI endpoint DMA.
> > 
> > The three series are:
> > 
> >   * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
> >   * part 2: PCI: endpoint: Expose endpoint DMA resources
> >   * part 3: PCI: endpoint: Add PCI DMA endpoint function
> > 
> > This series prepares dw-edma and dw-edma-pcie for endpoint-local DMA
> > channels delegated to a PCI host. The generic PCI endpoint interfaces
> > and endpoint function are kept in parts 2 and 3.
> > 
> > v5 is based on next-20260715, which includes Frank's merged dw-edma
> > descriptor-flattening series. Parts 2 and 3 depend on this series.
> 
> Sorry looks like rebase is required, it fails on patc2, which I resolved
> but failed again at 4...

Sorry for the delay over the weekend, I've just sent v6, rebased on
dmaengine/next:

  https://lore.kernel.org/r/20260721062815.4117887-1-den@valinux.co.jp/

Best regards,
Koichiro

> 
> I should be pushing updated next this evening...
> 
> -- 
> ~Vinod
