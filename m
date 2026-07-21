Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623C42A7B5;
	Tue, 21 Jul 2026 23:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784678207; cv=fail; b=aUH58QJ/Gb036VaiSAEWhGRqSmMZFI9TlFGxjgIN9VU5fGafCo6fj8dBPbtX0LkgXicf4lu5Qd6pAF+TWzOUWbyrCSVEdOUet3W6ViJqyWpqHhp5MgEjRlQ9Z5TNwQoNi3uEb1PCTs+QUKGz+XAfClJew/T5yKCPFOKi8gXOtXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784678207; c=relaxed/simple;
	bh=G1clT5I3rDAlIlFd4cuX5Mz1EyQm/mauzYc9tx91Th8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=e9p9R3O7VmAfgvEDXUdj1EFJl0Sxvsx2XET73SyerHuS93RbMkessCF20Bgn4lvZzBEKINIquRusDYlo5xBzdIAhal6e++hVflFWQ10PXflyB4W3xHnpxXhyQs2lbLfQu2B6nZ9Fc/CIr6jYUX3Mv8YtF9FrH4AYdQ/gzdYPvJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T/OPqj4F; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T/OPqj4F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7/y8Ee35SC24jyP4nNqAZ5oCafciRZAejfWi/sfMsdba5jl1Q4ROwc6pxouy59ADfx8W+bWxUcmdy8G68FL1n7wKdHblBLCrjzuYVv67/c8aKsKg//fpdmM1BDJlVR7O1tVJH3nKzRTukF+pIhWQAI3XxzU+XcDswvI5OmBlB+oJ7L3LVrWmyoJnhnbBAFi4dTQs16XdPGGfSw4oXQjKyXaE6HaEhBpBpamGTLJJLgH8mVUo3pdZu6a77zPyoNeeXbBlJ0BQwftG5sD20k5MUygt3TX4FuSe3V85DGbcv7z4DwCqUtYBvU9CPJrDzWlxR6iHwRgOcyS1KO5vJVOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgx2FUk9xSYgWyv6PqQQeU6oTCvLidUHSBV45L9sz7c=;
 b=N7IhzS5zqfCx9IdodN7OP2ClEuwjnRibIqDa18r4sEWF2kXEPZtx25MX4e4iccauExth4iSAiP6zEBtLW7UMc35c95Y7AV0x703CeIOGRGCjMHklE9BcPpkIGhh+YmXdGljz9T2XzZkB2gzRwH8CrFv4qx+Us7XRD+4nDlKakyQSWngeWqPbNCI3gphpPfsvvtht8hyLNbJCYyenR/1XkXkcqpZhVfe6zo2DFmiD+KjouAO1pjUSRNCKA+TgmvDg2btHXrNd1LqYqT27bV+8KO9NJ6qcFawWQMPS5WeNbsXYacLT6qfdXUnW8SudL7P8OERWYI8QUgjZzCnEf4CJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mgx2FUk9xSYgWyv6PqQQeU6oTCvLidUHSBV45L9sz7c=;
 b=T/OPqj4Fk1bSzcJ3g262bxBql18k8bjgbUiX9g9pXEKWAKLWl2jYMLY9vht2GyEDVOK+yiz6YQ+VZkrdGAoilmfQ8uwsThbiwB4gAi72cUaNky1q5/en3TFptWVsFIEoGtdGBg5rgvZ/54G8cpy0t+ypwQ7I87sbCfL8ZDqnwRthb8A1YfKOZVYpMuFBO4PT02ImLXqhgpMIaDR31YQEio5g4/3nrE0Jz+J1R2vn23UmttdBxFgZsUa00v5b64T+rDmpi5gxvqA8hVtkTN671LGc5IRIM3WibUU3ZA6RO9Zlq8W4bCHbCG5CKfD/Ln1meZXosl8ErxkKlC3FfngrSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:56:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:56:41 +0000
Date: Tue, 21 Jul 2026 18:56:31 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 2/2] dmaengine: fsl_raid: free resources in probe
Message-ID: <amAHLyNM25898nQz@SMW015318>
References: <20260721195422.353794-1-rosenp@gmail.com>
 <20260721195422.353794-3-rosenp@gmail.com>
 <al_n9QnYzdvII8fZ@SMW015318>
 <CAKxU2N8Gw+3Cgkk7FvGVoR2V-hDUafVT6H_OOGS5Jd67BNWp1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N8Gw+3Cgkk7FvGVoR2V-hDUafVT6H_OOGS5Jd67BNWp1Q@mail.gmail.com>
X-ClientProxiedBy: PH7P220CA0076.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ea24a8-762b-4411-45ef-08dee783b5d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wzEANmXWG4jnKUZauR3WUNaPOoH6qYurZHf172jHiUzuelT7m+LzVtWwgbQmFYirG6jAzQtsvqRS6Xy4GhqsOVkMJhD3gNUKgN56eiucnEkHBd7TacbJSIRU7xvvYT0ZWRhJv+oYq2QEN0PYALHZS37M4aJfgU6Y0V8IME5onDgBrWxU95BgmWH+EtBpI2l2zEKDW9a9yKd60FwmoF1Jl2dnT2wweE6B/gXAOSmo2IhBL8jDmL8n6RQ3TYn3oUx1dXr9GRFwQ9aNRzWPf1VDAFQ1RXs8AlXT1NCNfb8xJd75JAGMRWIEvhPx0sRiHp0LQATxrewW1qIoIa9sLwbhMt5QMIvlebWgG01P3Mv5O0W4IPSlquQgCIMDUkkHaOoo8Ibv7xjCKhlk7U/a20scjwQyaMDId+ayASvf/GQRJQcuggbLoL7dHtxXjgbKvY37jykF4x+v9ii6PbGd48gRGWQWyN91NDRh4WfGpmijMofzci9se5AVklbtsPA4K1Uv6Vu8zgG/BWsoEY+iEFpr3sautNhUEdHQnPjMmk0LsdPAyvVJiohSFM+E4SaYcGEvgnQ1hf/IDr5HgdRRCyI0t62JZ/QLNZPAYyAxaYk9vWPkN8ddSeiUEbuw38bCu+ew1KWeWJmtxcmUnrcpzsu/dfEUsJmwzOXiPH0oaPeUgaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnVsMTBJOGFJMHV6NXcyaVZTamQ0SkhSWFpaNHJtMzd2d3YxNndvN1kvOXF6?=
 =?utf-8?B?UGxJQ2dFTFZxbGtHTW92emRKNTZYK0VoeVpleEN0bE5ybWlnRjBnUVlZQ2pn?=
 =?utf-8?B?T2laVWxEZWZoRkpndlZBSkdWUFliSWJVN0tJNnN0eUdHbUZTWkNKYmQ1a2Ju?=
 =?utf-8?B?QnlSaytjajY4UnJJRldLRlFpUDN6WW92QnplRERYbE1GV3d5Y0VqK0dQanhm?=
 =?utf-8?B?ZE5zT0dUSFA3TW1ucW53Q2pzczJxaHdhWEo0d0t4Rm5yN0dDUFA0N1VsMmhy?=
 =?utf-8?B?Y2gwbFcvYkxVZU1hTHdzTnRPTlFFYUZaZlp5WVpyY29QbjlGNzJPVnB2ZUNH?=
 =?utf-8?B?dk0rSmw4K0xNWkZlYlR3am8xLytHRGJwRmRWL2hqTS9NWkZXWDhUaVJib25U?=
 =?utf-8?B?R05GWGNIUVBtcXJTN2FtMk4yM0FIVXlhTks3QWR5UXp6TG1hb004Ykl1dVMv?=
 =?utf-8?B?NDZyMEtUeFUvOUFiQzVkOS9HbklqUVd6QVVKWmlXb2hkRUtOYjNRRURhdURI?=
 =?utf-8?B?dmVaQlI2aEVpYkg4RStoMU9RUmtRL2tNWDlMVjVueEpiVWVIOEtXZFVLcHo2?=
 =?utf-8?B?dVFQdk5FVExuMVoweFhqVkw4NXE4NjhubEZ3dlp2aG5vUTUxVEZ3RUllQzU0?=
 =?utf-8?B?VjdwdmhDOWZmVEFFVTk0b3VRVXhlUm5mVjdmaVNLMTlJemFlaUxabGtGaGt6?=
 =?utf-8?B?akJuYVpzZnlsMzEyUk82Z21BUWVEaTBvWEhKUmVhcXFyTEpndXNwL25nbERz?=
 =?utf-8?B?MHRmc2FRM3V0Q0dsTjA3ZzF3VHZqQldSTVZ3bnFEMDBjNjR6OE4rQzBSK1N4?=
 =?utf-8?B?bmE5UmJnM2RjMGhDMk0zSlF6SXZtODdpMzNXZ3lIVUZoRlhVVG9lNDNJMXZU?=
 =?utf-8?B?UFBwN1ZZRCtQd25Xd0owUVhEeS9qVEZhN25FMnJQTWIvYTZNaHJycGZFY0kr?=
 =?utf-8?B?enM5VVh1OE4zRVRUZ3d3ekZ6TlNlUXVCTDZHMndPUzcvREdEQmVJQXJKWG84?=
 =?utf-8?B?cU1ndk01VS9sdXhvWktZUE5oN3Y4NE16c3dvNHlxd09ZZmRXZ09LNUNURGFD?=
 =?utf-8?B?bE1YSWZMOTk3MkhYNWhhODdtb0g5L200QzhsbXcya2VpK0VYaFVaSUhYMkxw?=
 =?utf-8?B?enljbG0veXNtTm9idmc0ZHdGc1dlZlE0QmkranZXNWVSenIya0RRaURPNC9r?=
 =?utf-8?B?Q0dVZFBrdVJIcDFOKzVReVhDbGhWL2xRS1BIMVJwR0pLZTYrd1pKRjRJZ3RR?=
 =?utf-8?B?ZkVyZ3FwNlF2TGJGZGdWVHlvYTZvTkp2K055MTZCNUtEaWlTUjJpeGFKOTNi?=
 =?utf-8?B?eS9ZRnYvTFV0STZvWHBqNmZKTGZXejF6TUJxbkdteWVsanhJbTVMSWRSOHM0?=
 =?utf-8?B?UmRDR3o4MEljb2orMEtmRTBvMnBKeHJqL2JlT1lGaUVVKytrZngxMWRObE4z?=
 =?utf-8?B?YmtTQkQ1VmwwQ2VJaXNIU3pFTURKVVhXREJyVFNvekREWGYwelBTcThoSXRw?=
 =?utf-8?B?NGxWNDB3ZG9QcTRLV1Z5VDJNdkRoTHoxcDhDNVFaaWttbEdnM3o4Vi9zdTVN?=
 =?utf-8?B?OXZLaHJERnIwWW8yZGN4MmRUTndUaVNpZ0QzK0VyODM5czErUmh6ajIvUTIv?=
 =?utf-8?B?bzVRc1cvYXFUZkxwOHpzUmIvdFhrRGtuUXVhd2hMdHdCdFp4c25qTzd0eFd6?=
 =?utf-8?B?TEU2cEVaVEl0eFBDdC9Ld2hrVVduSVplNmpDTnRFVXo0R1FUa2NXVGJndkIv?=
 =?utf-8?B?YzNFL3FSVmlsOHhZNEZNZWdwYzhVYk9hdEFaTHVrLys1c0dDR3dIc1I4cGk3?=
 =?utf-8?B?dEF2NGk4UjEzZklaWlR1MWF2VGZ3amxOdVlJTURMWlYra1ZzcHEzQXJSMUZH?=
 =?utf-8?B?WEM0Y01xVStoUEZzUENRRkVHeStBaUtUL1F3bnpSMys3SWlDaDh4bk9QWXJz?=
 =?utf-8?B?UGltMGl2UGkwOWhXYlp3TitMWXdoQ0FMbmhKeEwyV25jSE9IcU9ibFVmaFp0?=
 =?utf-8?B?VzVWVzFTM1ovUnl1ZlB6VmMvRTFMWnA5U1M0VmhEajgvVG1TeGJ1S2laNEV2?=
 =?utf-8?B?bDdiYlF2ekg1UmFzUGtsa0FYZk1SNjJqOTB3WkZuMHdpa0t2aXpqVlF0eHZr?=
 =?utf-8?B?cFBpVzBhaytZa21GNkM1dlc5TFBXV0xxUlJQNVlwOVB4ajV5OEtVSlcySjdJ?=
 =?utf-8?B?blBLSmpLRWF2KzF5UXJ1cE9la1BBMndBMFdUSjV4YVc5RkZPU2JrTzJhMU04?=
 =?utf-8?B?cnVjOXc2bTdtVGwyaGE5NXBkYXdrMXVLcXpkQmR1ZjlMVkU5UkEyb2pFZ0xI?=
 =?utf-8?B?aWowVWFyb3cvSFl2QWVrcGFpcyt1M2lCU0NUZzJob3EyY3dHRXNoc1BvRTkw?=
 =?utf-8?Q?1nVdoinxup4dVrDi8ZxvdZzcm7d2JjSZGwKgg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ea24a8-762b-4411-45ef-08dee783b5d7
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:56:41.3523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3jOQfQF3EnH1aoqDJUUnfNd3CbMPt8CmSY0tw3u6QT1KzmEQ/6fpPnp/1pGJVaJmb6hcz3XLJXLxIsfOS7itZGZLXuJUV0+U7WNkANkM4erbSuk995BG/IYeS8cBYDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106

On Tue, Jul 21, 2026 at 02:53:17PM -0700, Rosen Penev wrote:
> On Tue, Jul 21, 2026 at 2:43 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jul 21, 2026 at 12:54:22PM -0700, Rosen Penev wrote:
> > > Add free_irq() in the error unwind of fsl_re_chan_probe() and in
> > > fsl_re_remove_chan() so the interrupt is always released.
> > >
> > > Also add tasklet_kill(). Present in _remove but not _probe.
> > >
> > > Also add platform_device_put on failure as of_platform_device_create()

platform_device_put()

> > > increases the reference count and needs platform_device_put on failure.
> > > Requires placing the pointer in the struct for the _remove function.
> > > While at it, use platform_get/set_drvdata as there's no need for using a
> > > device pointer for that.

Needn't "While at ..."

> > >
> > > Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
> > > Assisted-by: opencode:hy3-free
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/dma/fsl_raid.c | 20 ++++++++++++++------
> > >  drivers/dma/fsl_raid.h |  1 +
> > >  2 files changed, 15 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
> > > index 2d54879cd6e1..cabc79e61e85 100644
> > > --- a/drivers/dma/fsl_raid.c
> > > +++ b/drivers/dma/fsl_raid.c
> > > @@ -661,8 +661,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       chan_ofdev = of_platform_device_create(np, NULL, dev);
> > >       if (!chan_ofdev) {
> > >               dev_err(dev, "Not able to create ofdev for jr %d\n", q);
> > > -             ret = -EINVAL;
> > > -             goto err_free;
> > > +             return -EINVAL;
> > >       }
> > >
> > >       /* read reg property from dts */
> > > @@ -688,17 +687,19 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       chandev = &chan_ofdev->dev;
> > >       tasklet_setup(&chan->irqtask, fsl_re_dequeue);
> > >
> > > +     platform_set_drvdata(chan_ofdev, chan);
> >
> > Previous patch already set, why need set again?
> This is because request_irq uses platform_get_drvdata.
>
> On further review, I think chan should be passed directly.

Yes

Frank
> >
> > Frank
> > >       ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chan_ofdev);
> > >       if (ret) {
> > >               dev_err(dev, "Unable to register interrupt for JR %d\n", q);
> > >               ret = -EINVAL;
> > > -             goto err_free;
> > > +             goto err_free_tasklet;
> > >       }
> > >
> > >       re_priv->re_jrs[q] = chan;
> > >       chan->chan.device = dma_dev;
> > >       chan->chan.private = chan;
> > >       chan->dev = chandev;
> > > +     chan->ofdev = chan_ofdev;
> > >       chan->re_dev = re_priv;
> > >
> > >       spin_lock_init(&chan->desc_lock);
> > > @@ -712,7 +713,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       if (!chan->inb_ring_virt_addr) {
> > >               dev_err(dev, "No dma memory for inb_ring_virt_addr\n");
> > >               ret = -ENOMEM;
> > > -             goto err_free;
> > > +             goto err_free_irq;
> > >       }
> > >
> > >       chan->oub_ring_virt_addr = dma_pool_alloc(chan->re_dev->hw_desc_pool,
> > > @@ -744,8 +745,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >       out_be32(&chan->jrregs->jr_config_1,
> > >                FSL_RE_CFG1_CBSI | FSL_RE_CFG1_CBS0 | status);
> > >
> > > -     platform_set_drvdata(chan_ofdev, chan);
> > > -
> > >       /* Enable RE/CHAN */
> > >       out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
> > >
> > > @@ -754,7 +753,12 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
> > >  err_free_1:
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
> > >                     chan->inb_phys_addr);
> > > +err_free_irq:
> > > +     free_irq(chan->irq, chan_ofdev);
> > > +err_free_tasklet:
> > > +     tasklet_kill(&chan->irqtask);
> > >  err_free:
> > > +     of_platform_device_destroy(chan_ofdev);
> > >       return ret;
> > >  }
> > >
> > > @@ -892,6 +896,8 @@ static int fsl_re_probe(struct platform_device *ofdev)
> > >
> > >  static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> > >  {
> > > +     free_irq(chan->irq, chan->ofdev);
> > > +
> > >       tasklet_kill(&chan->irqtask);
> > >
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
> > > @@ -899,6 +905,8 @@ static void fsl_re_remove_chan(struct fsl_re_chan *chan)
> > >
> > >       dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
> > >                     chan->oub_phys_addr);
> > > +
> > > +     of_platform_device_destroy(chan->ofdev);
> > >  }
> > >
> > >  static void fsl_re_remove(struct platform_device *ofdev)
> > > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > > index adbfede330a7..34d362803610 100644
> > > --- a/drivers/dma/fsl_raid.h
> > > +++ b/drivers/dma/fsl_raid.h
> > > @@ -270,6 +270,7 @@ struct fsl_re_chan {
> > >       struct list_head active_q; /* already issued on hw, not completed */
> > >       struct list_head submit_q;
> > >       struct list_head free_q; /* alloc available queue */
> > > +     struct platform_device *ofdev;
> > >       struct device *dev;
> > >       struct fsl_re_drv_private *re_dev;
> > >       struct dma_chan chan;
> > > --
> > > 2.55.0
> > >
