Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB83D7A0F;
	Wed,  9 Sep 2026 21:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987702; cv=fail; b=DLzDvrfEti0XqDmNjqAgmcJ0u0ici3OppyVWdOur26ZRqNNmbbWj1tKc13fal6J2zrv8JV01gU9RungPAqHeyYa91Gp6J8J08KA70YTAaisQnJuguNpM0z/XdaCx9UzOpoB2muT7PgFH8mlefGhbBLUmwQTl3RUDsSAXHcnw4zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987702; c=relaxed/simple;
	bh=vxtVXY7HJD1wsRwoiPEadM5VyyIV/ywZI+rGhgsOe5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c8DV+Ze77urz0FMyF4V/Rs7jkXJtQxysgbExkDWoVi7k7nCm8dqH15imU0XyDJq8ly+OFnAOlnPXOL/pf2XTTb2VP5kndwmSTF7Fy2Y6PwYfU4HMrQAcXJaCpbBSJx1jdLMpiP3w7fS0gqSt2AEWr+pKLgxawLran+sVhJyWRWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iPIA5NQl; arc=fail smtp.client-ip=52.101.83.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iPIA5NQl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ol8qv9FleCyDEGk6uhwIIC38Rw68XWmNzfWWmXXmQtQhMw4NM9J5qNahUhDi90J+3nfM9hZdHGgmfV7o8vEcB0dWF9OgJVxUohiZKCB0aPZ1DmmkyR0ZDqVwVoKRI0xrHsFgs+tRDWEhOaOpllzNmAKihPfFTG7gsnUY/OUQGax1OY11tN/EU5SM3UzxN97vtAJ+lnbieHMTiyuWGSxdgj0tg8I9ArxQypEIiqMQT1K1QXXdj1ekxkloFUYgNTzOHgFdgLyKDjIx9BWe6002wz33DgWwA+YHqhd4DtkaIn4LdI/PwqVkvCncYdKld2Tt1H9rrbN0NB00KYrbBRYicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLT0i6FCHN/tCzHWN7kxRDzM3JAqFht1ENKYa5blUqQ=;
 b=Ap97rn7Z+jgc01M682NWfkwWF4M0aHfnKAsDITCKzoagb2pb/KcGfow0M0hsX12AAaRzN8Lbm3ltN1gzZBQcDnu2sQtZqtfbLevbkhUXlrYyUOJul33c73C9BdlchyC+qyHqxCvtFqeZqGpEDfJGgBx9k2EWzzlTbg1QzB+UiZlBkg1VnE4S6SHIf0e9AfJEvxNqZyQS3PQwMvJbH8fvuyS8Lkx5ROgeyTc7MmQ6vIMykHtir9pcMHY/zEDh179KRhIRWjmmVbhYvamNvv6AYfpF8rU+tq71nUIIGGUY6lDab8agXZ/SCCAfKyTphJq6J1sMRrbEfdkF2hmKliUOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLT0i6FCHN/tCzHWN7kxRDzM3JAqFht1ENKYa5blUqQ=;
 b=iPIA5NQl3dsu/o0jemsLRNpu77+tm3fmWSmC9iZ9ji72iZrfRYz02oR8CgBsFi/6Chr+8vFYd8lSnekdHqgPRDI/uDjHTc8sAWla5LCyybJmq+wSu8cicGxKIQNzAMYig5TBkEri+XVFu3nHZU/KXPDpv+EqTJA0byHJtfWwLaF/kfT6qtfMQDKvx+n0GsZtPosPBfTu4TB1KxfIUoZ4h25UwVn7+zf6a5P4icV/QRmuUdx+zFEexZ5wVSBi3FGhlK7KTuXZYpy+mL0X5ERehg/dGnn9dMLhDbmwsj/GKueZoaiKa1sBihUqSKyWFAisl31yk/2hprFGl+qPy+BjLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8969.eurprd04.prod.outlook.com (2603:10a6:20b:408::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Wed, 9 Sep 2026
 21:01:38 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 21:01:38 +0000
Date: Wed, 9 Sep 2026 16:01:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Baineng Shou <shoubaineng@gmail.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mmp_pdma: fix wrong sg length in
 mmp_pdma_prep_slave_sg
Message-ID: <aqHJKbBTNrreoMuI@SMW015318>
References: <20260909033841.1395793-1-shoubaineng@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909033841.1395793-1-shoubaineng@gmail.com>
X-ClientProxiedBy: PH7P220CA0126.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dd5d3c-3996-4571-c928-08df0eb58a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	AVMy34l1m1ptXK9HU+eSuaW5y7UZcM8e2lb/wZYSiihKI1e5lSESmKoezdguTL+1AKbJ8LfdS1edFcMnu4QLNsnTwXr029m5HrNAu6eHJ5NN8vR8eUKK0ELGpDNmWFvm1zWBnBpxZf9hL1SztLkgpuFzAR6vORaMKHLfZR3w6K3PYD7dGrclQOJMEKWjFb6BggKu1vcRkZjla76XBzDEZC8CJz11HD6RbIqRQ6fXlpfdFtuI3XSCuUOFY4Md0McDJDokEbpDBYvTdWHvGqFf7hVURuzcTi0NzTdC/DsOINp85T307xG1nz2UXkbFsJpJjwTYYSmQ3TPf0X+DEGNOwFimaKjtlqtfxJXsonvTgtDQkw69DyZ/c8rU7i3uugxVBhNoL6gsUQ7OsD1ONjaK7qHimjAR4pmNEDI+I36Rhq1UQWphkHdsQy7kbfK6MmiImBpOGHi6lPIfS0CX1+D762/aOOiYHhys9uGF+8cRt+2bktCiSZ511WMp6noA27ptmt1MWbbGu9QyrlAiJM9jl26Nb/o839POLh7sP2VY2ass5aI8x0VBRiKdbXDtaIWiEHJgtYCV1XIo7de9KpkpvU105wSbm9xVoQVSiqmuHUtZt9M0LHrF8lxby2QI9CztOa+RJZ+5rgexOyzsrJCbSnlg6rExSxavDKZZDhgSU+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0uTKkEhjv6hJOZQpEGyf+oRwicoQwT6/K6TjYqmPrSfP9vBaUCtTO/cQY9uM?=
 =?us-ascii?Q?xFHl7j7BqasqyDejSkI5R0psR486fOeeQNl7Qrl0JXEBf7HuhX2xwW3HPbqD?=
 =?us-ascii?Q?u+WtJHrnnHoaRJ6mSSNOrVyRAD9gOQ55ngfH+gf8UBYnB97mBHu7Pt3Zowpo?=
 =?us-ascii?Q?MpYTOgT6vUo0kanhV3wWmQYmZBNWo8ZkRNxxyEJrDqI2kSNuqXuUsoY92ksW?=
 =?us-ascii?Q?k2NE9Qs0FCljyjqLJS9GUpggt82xU0gAF/w4KHsm9g47pl0GHSZhLmPKQVmL?=
 =?us-ascii?Q?kwzLkajXSHbkfzj+vnJ++AQt51veaOF7FWZB+ufeQF4PkMsl4BoQxlcVWwE7?=
 =?us-ascii?Q?wDH2vioVur09uO/YzX7Uw+UC4hYXUfZy1v2JkuK/cyzAq68EJ+PnIC0kxSFq?=
 =?us-ascii?Q?JNf+HQ8ibqZf8ykFCAtkGn66X3RqgRhRE2fRzS6Ds7t+S9cyl9KLaUNLoYTK?=
 =?us-ascii?Q?0nqNUxoA1YEJdj6v7/815vkul/85uQ7xUpRWNVKc68U7yvcLsVMXANd1Fap0?=
 =?us-ascii?Q?/rVEcBEBIyXPoMfZ4lwD/40/OiwPUa4r8MjiLY4Zv9dND6Qa13p+8OdtWE3x?=
 =?us-ascii?Q?rje/3M5Jwne4CHYwnu2iAtiSRPrGlaKaGYdK9uGQA3vcOhotPJUEcg7C6xdJ?=
 =?us-ascii?Q?0nmC0oQilUVfzFpkS0GYnIz7FrxxDy5ce+C+hJhJz+sp4f2tC7fmBsL/6Eb2?=
 =?us-ascii?Q?EHk8SvkImULXoPEkSEhoTdCS72mzeDH/IUMsw4ozVzrxezEzOiVDk3kOD810?=
 =?us-ascii?Q?PgbwZ0GtrRhyoyBKYwbTBxuxdC1JhqOFJYZNJsoG3zGG3IwVmkZSpYU3AMgr?=
 =?us-ascii?Q?58ob9h0vVMNhdnZdzyIV/8m+MkYyJenceumCMnqMgHUZFoRxADr5w2YfEaMA?=
 =?us-ascii?Q?1mf8GbjQBggPoeb0lsYGuJHmqXZYPrUfXjBbt9PsYccUiwO6+zTA8rujgjb2?=
 =?us-ascii?Q?pkG8BYuzIqdnBOy/Dyo4IyNSbnCLppgJngkPUyPU7vh3KfPqLNeKqGhYJX8T?=
 =?us-ascii?Q?kpfhJVfNbqblbEqXQf1lZsvvq60n0CEhc7qf4bFawuzmNmopELS3d2sEsi4v?=
 =?us-ascii?Q?dLs6LnrfvIGK+fjoueQzJ5fBpEZvenKidchg0zlRDgrat9JuQeo602HVmgcY?=
 =?us-ascii?Q?sebExagaXhVOAC0X7gdKfEE5myLRjsSBjr4oY/qSQsrX3c/qtGdjgy/zismM?=
 =?us-ascii?Q?tL1KLvt9Kj+w/2W7bfGIcUXPL6/YAjhNE7Gbe3bJPYL7QeEnDKPWtuco+hZA?=
 =?us-ascii?Q?UYzpfi07JlPHlkuxNTC8ymymyckfLmtqlCy1ueQDijEp7DoJUiPlgEDR0yo2?=
 =?us-ascii?Q?P9Hh53QlVxNZ5oqrcTv52iTBmHZHjcbqMzDAlpBIa8NNySUsEioRnpgR7m1D?=
 =?us-ascii?Q?Yf+3Qa9h3c3HTqiaxt3NRfzSzWGgUwwAywCRYDqyOpLb4y0MYMGgukB2cITu?=
 =?us-ascii?Q?mUheDzIZTN/skFGRkFQ8bGV+IKgyjSL4esWEl9qslz2Yfk5kFw1tL4tgzGaU?=
 =?us-ascii?Q?DGD7cdynBdNsXMUSUcKf3SaHJQheJfWj1ZdC2RRcSM+oDFi2cTk4vtgYfLEA?=
 =?us-ascii?Q?Ddj2qdi9npXrHXdQ8MSdoyy6nD8UfgsbkMIw9wd0zdc8OLjyhLSWGDHG0ToS?=
 =?us-ascii?Q?HKKfHvOwQtagmQboxoFtRlkSAR5WLY4xlZb5dRzfV5KNB7vJR2jGSQKTKd/V?=
 =?us-ascii?Q?8iJRX4wn6cryCmyjUvSujqNpU9cQJC3L66EH5ildwNjRYA2xHoWPW/PbmApZ?=
 =?us-ascii?Q?+fV0VTHMqlnHp+w+gExAQqg8r3PKvR5G8mP9+IxNUKGnfoIoOpNg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dd5d3c-3996-4571-c928-08df0eb58a05
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:01:38.0318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9bi3hvPNSv/OpKL9N7Rd4VzHLuxajCROPcRyOBpTI3B01f5MyYXA/6RBQHGugyE3MMj5O4S9d73jt8857E8ywCkhv58TswRgPnY3f63Roh2yTsn8I+62z3YMpx8eAn/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8969

On Wed, Sep 09, 2026 at 11:38:41AM +0800, Baineng Shou wrote:

Need () for funciton mmp_pdma_prep_slave_sg()

Frank

>
> In mmp_pdma_prep_slave_sg(), for_each_sg() iterates the scatterlist
> putting each entry into 'sg', but the entry length is read from 'sgl'
> (the list head) instead of 'sg' (the current entry):
>
>     for_each_sg(sgl, sg, sg_len, i) {
>         addr = sg_dma_address(sg);
>         avail = sg_dma_len(sgl);   /* should be 'sg' */
>
> Consequently 'avail' is always the length of the first entry. For
> multi-sg lists this causes out-of-bounds reads when a later entry is
> shorter than the first, and silent data loss when it is longer.
> Single-sg or uniformly-sized lists happen to mask the issue.
>
> Fixes: c8acd6aa6bed3 ("dmaengine: mmp-pdma support")
> Signed-off-by: Baineng Shou <shoubaineng@gmail.com>
> ---
>  drivers/dma/mmp_pdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index 386e85cd4882..e90fd2023af7 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -713,7 +713,7 @@ mmp_pdma_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>
>         for_each_sg(sgl, sg, sg_len, i) {
>                 addr = sg_dma_address(sg);
> -               avail = sg_dma_len(sgl);
> +               avail = sg_dma_len(sg);
>
>                 do {
>                         len = min_t(size_t, avail, PDMA_MAX_DESC_BYTES);
> --
> 2.34.1
>
