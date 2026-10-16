Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013053.outbound.protection.outlook.com [52.101.83.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4B4F0559
	for <dmaengine@vger.kernel.org>; Fri, 16 Oct 2026 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166422; cv=fail; b=a3wbGpoHeDwS8N1SFE+oSmqWCVPwdkdxOUZBboqz0UkqvDqbT7BuAMeN32eahfmC3oiXBuIfLtbCPWrau7gotRJwc/v78uCDtG4rFlw9A67JO9LwiTYtiau9RUnnsl8euBMD6Ui8boM03vCBxBwnAln7DsAK6xZySYet8ZVEeoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166422; c=relaxed/simple;
	bh=txcfs3doIp+gxtQ5/354sV6OsZyDo+NaSvRQwlUsJ2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=otRpoXmRmC5XClH65GPGYlPL9KtpoBVxnlyyK6ONq0ZCqmrkCGszuaelnmbIQmSKutSiv+nmO5ZWUChKlcaDrqlKNIrzW/PgZXGUAsHLQvDWq7k9/BUnMkbqwppiMHmKOC4BW/qMN+4AqEOOIx7aurmFIIlxK8kEPo1Xna7sOVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r7RfNsWc reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r7RfNsWc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HepxoJStwgP9ne0102QpEgbBF3TnEyN191UaKzbtbaHSvLnOw7LcktkMSXNblfCs0nkH++OULMDPBplSGdHGYFCJIABr2GAhy9KlGgakDJZiQ6mbFQItfWYz0vcMe5WmJXoJRzOGYbzJqyUzKE8FfBvE/06MOY7pqwLVRtDyuW3kRXN65io2cgsLkz/Ug38mqPlicwf+ggMCjOs9PWFwJx1H6fHvrh6NaVw7cBhe/SdqDNc/TEjWivMbOO2s9dKlh6oVoOvUEScJNcEDox0YsRydt2Bnnp38iuWrk0aiyLxa31+Kv1UTbFoA5mknr2K+kPUi/lM7UCYjFQfQ1TuJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPchw6wPWF3ccsnct3bQqoutCgjVKfNDpmUujKtfZxM=;
 b=y2nXvDOcei8HMbRhxcTdoMARzEYeFvV1/N1pQ81UoUqqr1+ifL0a4XJHeAnEuyLA0K3f9//4h/ux98j5sRIHxhVdx/8zyMdunQbSU8r5Nndojv9AoGXz4Arjm6a0RbxIyaYiE1ch3Se3ukqDKT9FZnFiKXcSb3v53S6EUqXUbtnweAhHlEMuOfHQrBXQvcLjt660C+NI6g7pckjz8A8PuJnW7Qqx4TYqHlcnkPwbP3DgNgx3zj5smto7kJ2zcWVfUS3rpgPBElDrOS/tNMFuONu778YElaS8IyD5P47b+LAkohUmg1Tr08tItaQhAFDmyYhERYVi5KVm27B96YXCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPchw6wPWF3ccsnct3bQqoutCgjVKfNDpmUujKtfZxM=;
 b=r7RfNsWctd0i7k6UkGG7tdbAsgcLyGnwiz4XYov3K5Lw5+YMcfBt6qMoyQpyqwJAp2sqTpJBkJHBf9hnAcRngbrHOSIIGAm+GcjYFuanOkgxNP0bio9Nhpn0yZ7ktoqoqLv3fhlfB6WUTLo2FTae6zyicmTve+SGBnIy2pY8DQx5U+rkuDUkAV0Ux3xfX0ZunFR+pn0zJMEM0Ql20qrAoeioAUwh3vIyOXCALQqoVFYEE8CKONe+hpKrfO30j3kGpvEWA+DNl93Ti1azbklXk+zo1nYUH/7C/eOTKKJNv3fy18Ohl//7SlIdZTtG+0NPfp/gxusCyDq1+W7vbeZC1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB12630.eurprd04.prod.outlook.com (2603:10a6:150:36a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 16:00:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:00:15 +0000
Date: Fri, 16 Oct 2026 12:00:09 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mayank Mishra <mayankmishraa@google.com>, vkoul@kernel.org,
	dmaengine@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH] dmaengine: pl330: Fix NULL pointer dereference in
 tasklet during channel release
Message-ID: <atJKCX5dksLRbeAi@lizhi-Precision-Tower-5810>
References: <20260709125914.1079328-1-mayankmishraa@google.com>
 <20260709131537.4CA6B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709131537.4CA6B1F000E9@smtp.kernel.org>
X-ClientProxiedBy: DS1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:455::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB12630:EE_
X-MS-Office365-Filtering-Correlation-Id: 838dc338-439b-422a-283d-08df2b9e9177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|6133799003|18002099003|22082099003|260925021311599003|260925022911599003|260925021911599003|10067099003|3023799007|4143699003|11063799006|261009223027099003|261009221227099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	dz1xSQYVCejknlICESc3eV/0Kh9KRMSOkYDnrLRlTg6cDfYvDP2Y4bHuJpfdggvSSjSp7gzXQaCu/2WYPFC+NAfGKGy+BHDw4SWp9tZbF9fsVPs2JqEi78yaKECO4udiYmMkozwJ1wsxt/Lx+GpmaqyjVVbMQu9IZ092vvd2z8WiM2pUvf6pUTlWJfxiHIz1FyHVS7q4ygyILP7IHkr/FhYYwgGpkf+a3Hyw1Mnbqv7S9cKAa8pBugmLJjZujaDpvS/Uw1OketmJOhJXCd+UQdyJ2Wvp9YEHiVSMSqli/XvBh/hn3IrdkJ4kfsLRYaEFcVuBh6h56EPD+HIqEgSLVoSfG+2QjbP6oc0dgmJOgdwnqKlINPmD2xAzik1G38R6Y/Cx/i57d83MrZSEZjI8/rX9kxsJ1nLRX3Pa5TQ+B/ItQggdfun6hgZfy8OQVgASCVFC5fzb9aZRzToQVTqNPEq778VnM7btgLbK6s2JGqeYshWY5uvdqlx4wZM9tT7DKFm4VKzaYXS729FoeC7UrpXuCORfeR+nTI8p3oyZMm8YkaVDYVKmd9KNAf7GJ6hAnrYuwBSlnrbzbG0MI5abcTFeg/PIXUKzd356JFeL44k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(3023799007)(4143699003)(11063799006)(261009223027099003)(261009221227099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?h3oZMuurQ1kBPiGfhH6Jh0/77tKskAD1uQwN/qrLvOPh8xdUZvTRwqKMVD?=
 =?iso-8859-1?Q?hVnt5lBWSnGzuPtAAsvcqnLnc6EmoVSNHIgb6P3wU8540GSj6I2m/H7Cdl?=
 =?iso-8859-1?Q?tC+gFeuK+rUrtPDg6g77spY7qT9jRR7lhCFPllr59wtuMtoZDa20rPq89d?=
 =?iso-8859-1?Q?w47nY7LBjywiAlHSNiKZh+doW5CCE43sesHzXwmJtHTp7gwY67ALIu1ens?=
 =?iso-8859-1?Q?gDR/k6T4g8xH8yU9Ja0I0jzINLHxsemWJdBTMWAChXU2DYBFCop7o+WGue?=
 =?iso-8859-1?Q?oIH9gmqOhQbx3kK8FSnIoZwjV/TsmmgqAe/vOyNg95zhJEqOEYWiyu7C4c?=
 =?iso-8859-1?Q?o8HMG2liOZIQhfO0rEFBfbdeEBSFRrDNbSbz156RB0cmiATx9jUdnA4OE3?=
 =?iso-8859-1?Q?+g6hnT5Z0KjKgzHZg6L2xP1yThcg2H2f+4XdRkqrUU0i4FCRSu2GTOv4ig?=
 =?iso-8859-1?Q?LLgZ3pbyAP7ptIl5qBv/ZM9lVkgOdvKq7NC28NemWcaCPludPfWUZE9SHY?=
 =?iso-8859-1?Q?SN+YL2c1jOY85DNwukNryAwlXPOnwE8S5gFOGzY+He0VS/vPnTH22nebez?=
 =?iso-8859-1?Q?unxLbLwiucEA6gYpJT+jDV7lxVE3ZZopk9strRCoV1TzZCRaBYTyGfqbwF?=
 =?iso-8859-1?Q?4H1QP1rB3bkUWPctV7IX3nYxKwgnrFhCC8s+ILBnJX6ilLHzAC5wO0rsz5?=
 =?iso-8859-1?Q?QuJizVhgmTuhtIzFJ+MX4gxIY/6U5UQrKv0ZadTLxGmZNRkiFtD25ZU6c7?=
 =?iso-8859-1?Q?zg17tVvsoj7Gar/zTUMN1QWgV6QEZUlGV4O3yEC0w+pOyZGYD3UaU2GzYe?=
 =?iso-8859-1?Q?816+jjNbZ65WMIa1w4HUf7PYGJhBlOj1Ut0LjJruNzl20WVwsRwghnPQyS?=
 =?iso-8859-1?Q?oMpKB8LzzNNd1x7lmH7FaVWxE7D4LsWoI5HWzt77+S2zADFNSMMQBxrsZn?=
 =?iso-8859-1?Q?pebCIg4qONieDEeJ8RbAYal4QSzJGoUMaU1YWr93w20tW/AOimikvRhn+f?=
 =?iso-8859-1?Q?h/zoUR7FOVZiAqgJQN0jw2MtVzYocc2GbZH+lYSFOsrbKizjLri9/xkAbV?=
 =?iso-8859-1?Q?KL1K6yGeOX104rUtxyI5iLij23XTxWnHGfi5OCctKVX/iy6dc1fYsn8/Qd?=
 =?iso-8859-1?Q?oc3vgGA+Zk+zarpcj1nIuygib0+iUs0SNOEieOdJqnVeLkPn7RNRLV3WNn?=
 =?iso-8859-1?Q?7RQQ/5k5/Mc0UKmPLY2CbarrmSa6adMWfJLZ7yyYOB1vOcldDtkvFhmTH6?=
 =?iso-8859-1?Q?UBw8HEE70HYzVmK8mmB7WgQIs3GvjeJ4qIwUwYQLs2hJLW56o0mKlu03z4?=
 =?iso-8859-1?Q?scJFbBlDZXIdf8P/6jLwk2b2LaP6eO16edZ6OPT0vk7CEBBKO0lCelJopZ?=
 =?iso-8859-1?Q?N6v+ItIqB0UZkKnjk2sTIE0Uf4+cZR12JQMBXJqiQwByrN0Q7DzGQOSuuw?=
 =?iso-8859-1?Q?XLBb2YnaI9GeNJdIKLk24FYL0jk2o879IeSizvuY/HkrqaUYPgUyQzPKJe?=
 =?iso-8859-1?Q?vNw8axlNMduUJKwGefLlfmlzdpgR6m+UhGKC5EBladIuY/BsAXIFX4qFzd?=
 =?iso-8859-1?Q?26iW/0+yMXKIAvZ7J8wgjCfxcmJXTKTTMjLv7eu2Vss3Isp5T6kGE6V3r1?=
 =?iso-8859-1?Q?yl3MnXcECVSKYn9cQCEtH2nkLq99mbRmRkgk9wG1wk/+cXUEp34xyCudl6?=
 =?iso-8859-1?Q?SgxGQuOYnwKyhA/81O2CbaJ6vfjTf84LWW8D2gbRShLR07jSVa+HzuFBAw?=
 =?iso-8859-1?Q?E1NJfXccBUc8dwaghnn8VojJPE5s+z2n+ci5ugNvmCEiDE4t1umWPGtZq5?=
 =?iso-8859-1?Q?fg1FH7FmMXDX5R/UEj8ScRJ+e+zqt0Oj9K8MmpEraXBFDpy6QxPI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838dc338-439b-422a-283d-08df2b9e9177
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:00:15.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJzOywCUeBu9517LifVzIyHuVSNJf6QqnSw4x5IPRtuJIUWk4DZbszRLdvdA2STAQLR7g/ZuaDZtpHu1SeJLbe84K4Nt4MtkQNM12NFkk2obZFTrxnmtKhix0oRWDuZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12630

On Thu, Jul 09, 2026 at 01:15:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [Critical] Newly introduced non-recursive spinlock self-deadlock in pl330_free_chan_resources() when aborting pending descriptors.

Look like correct, please fix it.

Frank

>
> Pre-existing issues:
> - [Critical] Concurrent modifications to the shared `desc_pool` without acquiring `pool_lock` causes linked-list corruption.
> - [Critical] Client callbacks for aborted descriptors can be invoked asynchronously after the client has freed the channel.
> - [Critical] Out-of-bounds array access in pl330_update() upon spurious hardware events.
> - [High] Missing pch->thread validation in fill_queue() leaves a NULL pointer dereference vulnerability, rendering the patch's fix incomplete.
> --
>
> --- Patch [1]: [PATCH] dmaengine: pl330: Fix NULL pointer dereference in tasklet during channel release ---
> commit 46db9642cb9437f521f1604962399f1fd25810d2
> Author: Mayank Mishra <mayankmishraa@google.com>
>
> dmaengine: pl330: Fix NULL pointer dereference in tasklet during channel release
>
> When a DMA transfer aborts, the interrupt handler schedules completion
> callbacks and marks descriptors as DONE. Subsequent channel release via
> pl330_free_chan_resources() clears the hardware thread by calling
> pl330_release_channel(), which sets pch->thread to NULL. This commit
> adds pch->lock inside pl330_free_chan_resources() to avoid a TOCTOU race
> condition where pl330_tasklet() dereferences pch->thread after it is set
> to NULL.
>
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 25ba84b187041..acb9949f4a626 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -2086,12 +2086,23 @@ static void pl330_tasklet(struct tasklet_struct *t)
> >  	fill_queue(pch);
>
> [Severity: High]
> This is a pre-existing issue, but might the missing pch->thread validation
> in fill_queue() result in a NULL pointer dereference, leaving the patch's fix
> incomplete?
>
> The patch correctly identifies that pch->thread can be set to NULL
> asynchronously, but it only adds validation checks after fill_queue() is
> executed inside pl330_tasklet().
>
> If the tasklet runs after pch->thread is cleared, fill_queue() iterates over
> pch->work_list and passes the NULL thread to pl330_submit_req():
>
> drivers/dma/pl330.c:fill_queue() {
>     ...
>     ret = pl330_submit_req(pch->thread, desc);
>     ...
> }
>
> Could passing a NULL pch->thread directly lead to a crash when it is
> dereferenced?
>
> >  	if (list_empty(&pch->work_list)) {
> > -		spin_lock(&pch->thread->dmac->lock);
> > -		_stop(pch->thread);
> > -		spin_unlock(&pch->thread->dmac->lock);
> > -		power_down = true;
> > -		pch->active = false;
> > -	} else {
> > +		/*
> > +		 * Verify pch->thread is still valid before dereferencing
> > +		 * it, as it could be set to NULL asynchronously during
> > +		 * channel release after transfer aborts.
> > +		 */
> > +		if (pch->thread) {
>
> [ ... ]
>
> > @@ -2357,7 +2369,14 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
> >  	tasklet_kill(&pch->task);
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but could client callbacks for
> aborted descriptors be invoked asynchronously after the client has freed the
> channel?
>
> During channel release, pl330_free_chan_resources() invokes tasklet_kill()
> early to synchronize. However, pl330_release_channel() subsequently aborts
> active descriptors and calls dma_pl330_rqcb(), which reschedules the tasklet:
>
> drivers/dma/pl330.c:dma_pl330_rqcb() {
>     ...
>     tasklet_schedule(&pch->task);
>     ...
> }
>
> pl330_free_chan_resources() then returns, prompting the client driver to
> fully free its DMA context. Will the scheduled tasklet execute later and
> invoke dmaengine_desc_callback_invoke() on the freed client memory?
>
> >  	pm_runtime_get_sync(pch->dmac->ddma.dev);
> > -	spin_lock_irqsave(&pl330->lock, flags);
> > +	/*
> > +	 * Acquire pch->lock before pl330->lock to respect the locking hierarchy
> > +	 * (pch->lock -> pl330->lock) used inside the tasklet. This ensures
> > +	 * that setting pch->thread to NULL and checking it inside the tasklet
> > +	 * is fully synchronized, preventing TOCTOU race conditions.
> > +	 */
> > +	spin_lock_irqsave(&pch->lock, flags);
> > +	spin_lock(&pl330->lock);
> >
> >  	pl330_release_channel(pch->thread);
>
> [Severity: Critical]
> Will acquiring pch->lock here result in a non-recursive spinlock
> self-deadlock when aborting pending descriptors?
>
> If a client releases a channel with active descriptors,
> pl330_free_chan_resources() now acquires pch->lock and calls
> pl330_release_channel(), which attempts to abort active descriptors by
> calling dma_pl330_rqcb().
>
> Looking at dma_pl330_rqcb(), it unconditionally attempts to acquire the exact
> same non-recursive lock:
>
> drivers/dma/pl330.c:dma_pl330_rqcb() {
>     ...
>     spin_lock_irqsave(&pch->lock, flags);
>     ...
> }
>
> Will this cause the executing CPU to hang?
>
> >  	pch->thread = NULL;
> > @@ -2365,7 +2384,8 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
> >  	if (pch->cyclic)
> >  		list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);
>
> [Severity: Critical]
> This is a pre-existing issue, but is it safe to splice work_list into
> desc_pool here without acquiring pool_lock?
>
> In pl330_free_chan_resources(), pl330_tasklet(), and pl330_terminate_all(),
> items are spliced or moved into the shared pl330->desc_pool while only
> holding pch->lock or pl330->lock.
>
> The pool_lock appears explicitly required to protect desc_pool, as seen in
> pluck_desc().
>
> Can multiple channels terminating simultaneously corrupt the shared list?
>
> > -	spin_unlock_irqrestore(&pl330->lock, flags);
> > +	spin_unlock(&pl330->lock);
> > +	spin_unlock_irqrestore(&pch->lock, flags);
> >  	pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
> >  	pl330_unprep_slave_fifo(pch);
> >  }
>
> [Severity: Critical]
> This is a pre-existing issue, but could an unhandled event index trigger an
> out-of-bounds array access in pl330_update()?
>
> If a hardware event fires for an event index 'ev' that is currently
> unallocated, pl330->events[ev] is set to -1. pl330_update() reads this and
> uses it directly as an array index without validation:
>
> drivers/dma/pl330.c:pl330_update() {
>     ...
>     id = pl330->events[ev];
>     thrd = &pl330->channels[id];
>     ...
> }
>
> Does this out-of-bounds memory read and subsequent memory write corrupt
> adjacent kernel structures when thrd->req_running is evaluated?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709125914.1079328-1-mayankmishraa@google.com?part=1
