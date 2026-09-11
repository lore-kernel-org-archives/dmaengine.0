Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF41D42E421
	for <dmaengine@vger.kernel.org>; Fri, 11 Sep 2026 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141596; cv=fail; b=hEScPXTlGAIO2BqBjOXmEpZv5Dn1QJdkW5r7kC1yVN964Dokuy5RG73r83Tt/X/t3W9m3mSiwFzZdsjCYkGrTZojmOAU90BudnQYeUm+OOMrDHYToYxxx3M2DoRRzPVz6Z6aZ4IMfrZUhyWv4i8C/RevBUmWz/lDo04b+bA0F5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141596; c=relaxed/simple;
	bh=q52i54jCoLFdkiiiqNpYM6w7Q/6Hs3yWeX7bBdwk4I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A42sr4/UBPjRCaro4sjjaq7dPX8PNN9eTG+CPv9Ir6ELyntkI0P9mZldJEIJfEt4xTlIF1j2fJstCPF+zxRNC1oH9ais9vSEDdnBet1O7AYPwaGFtdSWmvY93jGioV+UIQWZ1ptEokYbnZHfpYYUxoAkLEf3EZVVIDnfVJ4vAu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ql+gH5Rv reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ql+gH5Rv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuhvvsCRN/lWIpANuLL6wu5KAe6IV+Z0OKHRy4Ww0qoubMdixfeP9DbK52J1Fy+A12yBq2CNpdiOHCoJW6/X67kjCSTjSYKIvodWRmXsS8XrN60MO8072yEsxubgnDvd1cFXuWwvJeV5+i/7++oNZtBEQ/ZBbMsuKWISfUx6yom0xj2xOtYJOfwzAavYDZ7qJPkoIoaSyf+LHeoV9P1ybcq8et+9Yvedjyvt0KzCl9wo7MAYBQar4XPfVY4PE8WaKvlKSm5orAKyIizzQyYWavxsHGZHnbX5m7meTwbqQ/slnfLka6Jhc6KjSXlKmM4THyQtIuAh1H2WpP/KMQUCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzPicLFubZPumk7NgiiGn7T2x7Ou2qPBkcYxPC44ss4=;
 b=eVcUnhZDNFKcBdvriBp/xfKLdhdFokm0vRv2T7NKiHDSHhweUF/fLkNOoB4rAJ1RGiPQeMU+RWK5viDDorqwxSPTzNhxC0Mx1B1r+1RZP0D/hNAhZEemb77ozuJQgSdTVinHYysTv8HJGEuLKuyWxAmOGq7msgDkbdFJHevvQgd+D6AUcMkxZANPDrMSVPhxRvcTerp7THWZTF8jiLkI+ZXeyu6hVGhyqggdAzwmgJtSgrxuZZBFCCbPrrEkX1vZcA7S7ruMVUnDlt/n0ZAUiCtwsPc2WmxUV7hb91pTJC78Yng8fVMx9DFd77gtX3ylc2atoLMX4x/a9nRuO+A+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzPicLFubZPumk7NgiiGn7T2x7Ou2qPBkcYxPC44ss4=;
 b=Ql+gH5RvjUAM7RQ90VLswy2Lngc3ny+x2hD3HOyZ4poWzfzKefGo044sdqxXECHP557kbxMY7ePDJSq7Pyv5UDbwgz7ZAPIIzJwTJOW5kIFD1kN9PUFZ4g26wZdUpBQ7RGDjv5J5SkzpR6QiwCWjelSYR0XCmOneIp+vwc8Zdyn+HXdrcU8FxLQZoNWiGz/czobxpbHsaTAuyxrVJgAuQsXNv0D0q/5znR+WhDTLG/uvrTlkkFHoyL1UcawWmBMrFmbpyshSh8tI0S43dbn++qV7Zy1wQkF5EXTcaP19jIKTYOiSPQqxuFf6kwHGo7R+fPH0iUOjmDyGZ4gh56EjPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB8029.eurprd04.prod.outlook.com (2603:10a6:102:c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 15:46:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:46:30 +0000
Date: Fri, 11 Sep 2026 10:46:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Rosen Penev <rosenp@gmail.com>, vkoul@kernel.org, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCHv2] dmaengine: fsldma: convert to
 platform_get_irq_optional()
Message-ID: <aqQiTplr2_XDuGU5@SMW015318>
References: <20260910204625.55367-1-rosenp@gmail.com>
 <20260910205845.267111F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910205845.267111F000FF@smtp.kernel.org>
X-ClientProxiedBy: CY8PR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:930:4a::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b50c03-2c26-41da-d6e5-08df101bd8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|6133799003|22082099003|18002099003|4143699003|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	L80Eh21SCQB3n6z0lRwb5z9YKDfW+tJaCqlQDAYyuq6wvIWp63idXabK7nic6XycYL0P4N1ju3RkFyZEGbLppHjuigluTViJ4yCUfKWRc8/pCliihvUHI3TSrfdtbtE8o8YwH320t7Os6teoUhVYUOBKHbzXmgy8Vb9ZCxXdVyz7WHK6kI9Rcm/PF8FgkhlAK3vvbjMtWelldbd7UzdZAcCAmp3x61jcUXRkdp+0sTfYFH//P9jz2fx8YLk3M5NzbZEbFFPzCzGBLSz/XdT2Ejk7DZJa+Cw4BYPYkCckNDjoDRfiwZTL3im6IV2XaN8hwOA0TZosLcOyMGRzmgN9sC9Obj3/eGRkgML24khuLK4X9nvuIajGdTM/LyTnbNgqzUODo0lEUmifegry2kQz9ss6cD8LQ78dhWlCs0pKg0Ob50mTO59Ba808pBot6wrmaKl5E6uC8S1929J56PIaFDDdfQMh1rQehxPZj8EWUecD1xpKXCaNSgo2rsL1HU7pmvtfzFW/xvbU7+3wAmWwLiUHomTXDzAF1rYHUw9zhnI6i1A/mxpAlO+mZFW7KhMA9FV4TEDfztVnRm7kWVndFZhC3Xd85CUiUfExj35cOsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(6133799003)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Z0pl4Tlls74DYDiQ7jI2GwkLxrGBBhEp6Vst/sKgpsVCS4WXKjQVnw9EHi?=
 =?iso-8859-1?Q?REQMwa1XKM3J1Q4UQpavMYrPIOqQGcLDYljsZmU4ISWz6MTDmVFToRL+Jf?=
 =?iso-8859-1?Q?KeRmCuttEzDI657n+JJ42WrKjD7e0j5kwpoFo88UzYEEsNLGQ0pwvR6N8Y?=
 =?iso-8859-1?Q?Bu1UxbSsguwm+yvqTOcYYU5HORZ9czhwPFl26o/MRe54dOeoQaYq6OLGho?=
 =?iso-8859-1?Q?Pl6J7tMM2EY6UVuBbJqFnJ6Wx4CHYRBtY9pH55bVKuknWDUG+YhjgfKgbv?=
 =?iso-8859-1?Q?iIkZwqxq0HwqrJThp91obBLOPZRrNOD/7HndWYZ2jSN47V3O1+vx7yiG2Q?=
 =?iso-8859-1?Q?uj1755htU6yqUKgJXcfwLt01LK3vOJrUnjOoXOnygvZ4tQ31aMhcUe54B0?=
 =?iso-8859-1?Q?2aQ0BhJQYOThW4gY76GHwVlR8f/V7qr+kiDz4iVt3LCb90Hd+ds/+Qnebv?=
 =?iso-8859-1?Q?WKGXK/n20Y+Jzzo2AEaG5hUgMrlCTlc2uj9Li4AX0Cmiyc6fACvI5Lzr0N?=
 =?iso-8859-1?Q?wBmYDJSq8YDOO6vGIoNXMDwlHl0iSNMHN+srbVsmqIDiL+TE2yUHQp07GJ?=
 =?iso-8859-1?Q?rodC+AabqoTpj+EIsFLhTEnxZIRSlaEkMsl6Hva+Iq2EcOZItj6b0NWQfU?=
 =?iso-8859-1?Q?1hIaQJnGXAzvZeY6g6DzAgGRj14GWXlMH4EvecaEUMWrIXsciBpMnHdxWm?=
 =?iso-8859-1?Q?nl/IoDH+WF+LHtDyjVvbeOLDc6bHbrD94BuD9/t+5hfe86IAfauV7VdB6G?=
 =?iso-8859-1?Q?hs6VR9FIpiqYDmX3+JkNJJfpe7xHkZGo4iS95rBSJEz1llKe9fbIYLtCFP?=
 =?iso-8859-1?Q?v8bLZcehrpyl+5VGFs6OjMIph/OS4u4vJ4gRJrRTMyTiUJkWyXt8hUFdJo?=
 =?iso-8859-1?Q?ZUnLIfEB/VmlQsXH26NNkVFR5350ccadrNHoDFewdN3lkkVTNW9R5D617I?=
 =?iso-8859-1?Q?+WKBkpFQDT3AHi+AaEk4L+o40DMlE5/CUQv9oq5YU6NpKm7kvzJHQuPsZx?=
 =?iso-8859-1?Q?97eD8AxoJK+HP9t6RSyUvyd8sFwEyqzQJh/Oufg4Jx/uKPCtttkBY+Bf6t?=
 =?iso-8859-1?Q?hI1/S2qtxPUrmE7wmJdcxcoOuAo7QaDk6DpvmHiFwogutqwqggoN+UWWbw?=
 =?iso-8859-1?Q?vKh917ztzOJDYzrUPQrxR36DPpKkVbh/134a04BKh7BEbxBCIwSQu+XP1F?=
 =?iso-8859-1?Q?/2K//dvkFi8GnUJyVUmPO7Z/CsxgYYlPoFv+k+OeEvJ7eZVBzX9QdZqt5F?=
 =?iso-8859-1?Q?ZSiHQJpdC3K2MscTi2GeLPBmDGpZbNG4UdMT2e70oarYI9d9UdjcvDDb2C?=
 =?iso-8859-1?Q?8sYPIXstm1dsxiaLuVmdxo7KPMsBcYUyRJ/v5j30AncTMslgbKSetNllW8?=
 =?iso-8859-1?Q?wXAG3FgSoN2E7orHMz4aZJOTt7NIfi3bW9zj+H7cWf5ZTwiJJI+oDY/wqu?=
 =?iso-8859-1?Q?wv4n13Hctskuo2VIr+SaJpUxxxnvSXcizJjul3+pbFL12eW+ZWWMvLdBRt?=
 =?iso-8859-1?Q?AUGcxVk6BwzRunvQRgzvhOU+JudzBpx3xXaFmwyt8GtrlwIxe+s1nSDHwZ?=
 =?iso-8859-1?Q?Po06/4/dK3icQDitkKlfVj4nJDUetwzMqz4i6LLwmtfkFQ0ktIuHA7KKho?=
 =?iso-8859-1?Q?XIKYa2vni0uTrVvMwNn7dhUFV8ocxAo7ePzxpb+c9qJudK9JUQlHQAq0to?=
 =?iso-8859-1?Q?b9b0gfbintZla+fa0RMNn142ZZl41WttJnib52TwNszu/wdAEATnJxnT0k?=
 =?iso-8859-1?Q?DhGyIpFtoWvdcvAwxfLBosA4KhLOwLU3r6npMKZiJi7yxpKNabmi9AubSm?=
 =?iso-8859-1?Q?qKy43FNJJFa478rQEjQmL8bhd1uHYcDULlAoMs3z44VP65+1GpjQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b50c03-2c26-41da-d6e5-08df101bd8cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:46:30.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FdEN5VF8KssOt64d8pyH0xUXtxp6mNli4hw9IposIFK1NWUube/dYAJoVstg1Q1hLbrr/BAH0CdtMaQdw0wTQ/fVzSDGzkoh5k4kHaW2HhUtcgdkZeWgb6kCdZH/UW0Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8029

On Thu, Sep 10, 2026 at 08:58:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [Low] The patch introduces an unused label `out_iounmap:`, which will cause a compiler warning and break kernel builds configured with -Werror.

Did you build it?

Frank

>
> Pre-existing issues:
> - [Critical] Missing `tasklet_kill()` during channel removal can lead to a use-after-free of the channel structure memory.
> - [High] The driver ignores the return value of `dma_async_device_register()`, leading to a silent failure state and potential kernel oops on module removal.
> - [High] The error path in `fsldma_suspend_late` unlocks `desc_lock` for channels that were already unlocked, leading to a double-unlock kernel panic.
> --
>
> commit 8cf71591d829b94cb515a6922619751103de2f0d
> Author: Rosen Penev <rosenp@gmail.com>
>
> dmaengine: fsldma: convert to platform_get_irq_optional()
>
> Replace the per-controller irq_of_parse_and_map() call with
> platform_get_irq_optional(). The controller IRQ is optional when absent
> and the driver falls back to per-channel IRQs. The corresponding
> irq_dispose_mapping() calls in the probe error path and remove function
> are removed.
>
> > diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
> > index 22d62d958abd9..0637a7b2e14d0 100644
> > --- a/drivers/dma/fsldma.c
> > +++ b/drivers/dma/fsldma.c
>
> [ ... ]
>
> > @@ -1300,7 +1307,7 @@ static int fsldma_of_probe(struct platform_device *op)
> >  		if (fdev->chan[i])
> >  			fsl_dma_chan_remove(fdev->chan[i]);
>
> [Severity: Critical]
> This is a pre-existing issue, but does fsl_dma_chan_remove() need to call
> tasklet_kill() before freeing the channel memory?
>
> drivers/dma/fsldma.c:fsl_dma_chan_remove() {
> 	irq_dispose_mapping(chan->irq);
> 	list_del(&chan->common.device_node);
> 	iounmap(chan->regs);
> 	kfree(chan);
> }
>
> A tasklet scheduled by the device's IRQ handler can execute after this frees
> the channel memory via kfree(chan). The free_irq() function waits for
> executing IRQ handlers but does not wait for or kill scheduled tasklets,
> potentially leading to a use-after-free.
>
> >  	}
> > -	irq_dispose_mapping(fdev->irq);
> > +out_iounmap:
>
> [Severity: Low]
> Does this introduce an unused label?
>
> The patch introduces out_iounmap:, but nothing seems to jump to it, which
> will cause a compiler warning and break kernel builds configured with -Werror.
>
> >  	iounmap(fdev->regs);
> >  out_free:
> >  	kfree(fdev);
>
> [ ... ]
>
>
> [Severity: High]
> This is a pre-existing issue, but does the driver ignore the return value of
> dma_async_device_register() in fsldma_of_probe()?
>
> drivers/dma/fsldma.c:fsldma_of_probe() {
>     ...
> 	dma_async_device_register(&fdev->common);
> 	return 0;
>
> out_free_fdev:
>     ...
> }
>
> If dma_async_device_register() fails, it returns a negative error code,
> leaving fields like the device IDA and refcount uninitialized or zeroed.
> Because the driver ignores this failure, it will complete the probe
> successfully.
>
> During module removal, dma_async_device_unregister() will execute on these
> uninitialized internal fields, potentially triggering an oops.
>
>
> [Severity: High]
> This is a pre-existing issue, but does fsldma_suspend_late() unlock
> desc_lock for channels that were already unlocked?
>
> drivers/dma/fsldma.c:fsldma_suspend_late() {
>     ...
> 	for (i = 0; i < FSL_DMA_MAX_CHANS_PER_DEVICE; i++) {
>         ...
> 		spin_lock_bh(&chan->desc_lock);
> 		if (unlikely(!chan->idle))
> 			goto out;
>         ...
> 		spin_unlock_bh(&chan->desc_lock);
> 	}
> 	return 0;
>
> out:
> 	for (; i >= 0; i--) {
> 		chan = fdev->chan[i];
> 		if (!chan)
> 			continue;
> 		chan->pm_state = RUNNING;
> 		spin_unlock_bh(&chan->desc_lock);
> 	}
> 	return -EBUSY;
> }
>
> In the forward loop, spin_unlock_bh(&chan->desc_lock) is correctly called on
> successful iterations.
>
> If a subsequent channel is not idle, the code jumps to out and iterates
> backwards from the failing channel down to 0, unconditionally calling
> spin_unlock_bh(&chan->desc_lock) for all previously processed channels.
>
> Can this unlock locks that were already released during the forward loop's
> successful iterations, leading to a double-unlock panic?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260910204625.55367-1-rosenp@gmail.com?part=1
