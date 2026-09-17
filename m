Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4334E0B7C;
	Thu, 17 Sep 2026 20:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675754; cv=fail; b=UxU54lEh5AS5fq9PSleew5F8fTmXWNqMXQPzeuC9+K8MRTREPezIXaZEOmWpYBkRYjMwdyOX4GtCE6Tuz2f3w0SwjFaMJbL1dbJx+GRiqPPRnq01H98KHLO+Z/1ybInb/2PNdV7jhlxIoAA5Xewykjnvs7zKWP+hTorsgUqUcWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675754; c=relaxed/simple;
	bh=25M/iWs4+SxDoIa263gPmZv78jXDZP1voOrCO8YoIyI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JczggtHbybtho1Gi6n6l8MBy6rRN4ARRTt3Gl85HvBsFymhU2ijz8vFmjsYAjkZP7Ncpmk++9RoLsWDSq+6QREcLV4lXPP2Yz3TWFHftGIcx77hf0ryOPNex7VDCxuiXE8ecQYlziiKNrypkEPH9yzCb0Y6i93oLAl8x8xaKVN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q/wboWiI; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q/wboWiI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajib3Imwm8rYYuMu0sEtvf7WYfDsmBaAhKeU0A+DKMAX1iTGDNM/A4PHKXon0qadJaXryfWZOYXVMRgImAiSMLOQe0iVnd5fQG7pcs3CC31xbMHo2Au/zoKtOjyWPV+Kn+m+IE13GZ9ciBfYYMsEh3R7wS0CkoqqUPFX+4EfLsToF/ay4EqMx0CXoiJCBuwXWCKaCaCeiYGbXYxThbyn2oOXqqLoZEenCkoMGwF63cO11aWsT1Cng/d2sGa3Dt85+jD6zckjc6P7jYzMpwh09M/3uQdnmJ0VUGQuQE0OZhb3zrB/JnV7HXe8j5v7gdsBr5mUiKlfJIFCWuUFoc8KqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqRQAuCoQtrlP+mkxrGBRBgLWiHdlSBPwKXygZ8iXn8=;
 b=yIN++e8Ygc+ZRSX64OvZRCjnzBrXjAu1inochKbJdDg7opkXqpGQpTKObPont+IYlf34xJ9mvZm1qLHCiBTLtSjjJaj97jd6JX+iuwtb0EFQ/c2Ik2YoObUjlxnmKEvKQ+bfpDt+j4EdpvSt7nyLrfuJTQZIzYyJ9nedyd28NJb3CWlGO5pRiQsUlERAm3tbGhvDTg0+WFUniKEhMbVfmIezc2CuwSMDv2AZ07SJ0Vew5cGYrIB951/M1jSl/zlsMG+98bJ/qJH9miw9GEiESbJosGI2zzdHMD4CQ5rEmi4JVDwkptCG4ilOVeo5jWhOWoGCKvmD3WG8LNxJ+LjvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqRQAuCoQtrlP+mkxrGBRBgLWiHdlSBPwKXygZ8iXn8=;
 b=q/wboWiIBMS44f1VmwsdGECgJIH6Zw9Xa0r/z9dtoTp1WvWkgwiHqudXCvIkURRxn+bpnlrmxGI7Ri8bGA4JZp2m8U0AtlDnpybI/p1Qsad7f/Pfojp4oChf/AvgStFzyWpA/twULlmDTiH80gvKBGkyWmd2liHz2LJZWPURK/hPp80f6Snsi0JFaPDn32S6bw+FjwI34f+RP5reQT/hQMFYx7i/o9OxEMKj2cY4hUZNlVIJUKsG8ElCN3KH5sY4C1LsxuawfcqdAjbXYpRhZntdYDb6S5zU3rj+tv72N/N3aMJKYxPR8x3WQXNznpPy9Y4dcRT/2f6OSQcs2j092Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 20:09:07 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:09:07 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/2] dmaengine: add dmaengine_prep_slave_sg_context() API
Date: Thu, 17 Sep 2026 16:08:42 -0400
Message-Id: <20260917-b4-dmaengine-prep-slave-sg-v1-0-239c12864143@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtIrGoC/yXMQQrCMBBG4auUWTuQVtOoVykupu1vHNFYMlqE0
 rsbdfnx4C1kyAqjY7VQxqymj1RQbyoaLpIiWMdialzTukMduN/xeBekqAk8ZUxsN5nBFtl77Fu
 /dSGIUBmUetb3b96d/rZXf8Xw/B5pXT+UXEQffgAAAA==
X-Change-ID: 20260917-b4-dmaengine-prep-slave-sg-55e8653077aa
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789675741; l=997;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=25M/iWs4+SxDoIa263gPmZv78jXDZP1voOrCO8YoIyI=;
 b=Kab+I1i/f3Ll/4HzkyoAz2ZrmGwP/TRJFVgorJ9gilvfMCIrYOW5hZabn6NsWmjmqOroWhQ2N
 /B6OGS5JQ6QB6a/fR8haO34LoaVCyms3FD6EmXHDAZgNxjwVfIoWyLy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF00013311.namprd07.prod.outlook.com
 (2603:10b6:518:1::c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PA4PR04MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 748976ea-5c29-4980-8f8d-08df14f786c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|366016|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	asUgNXQGY98Urn8/0hmzpauaMKZYrUsVh5Eo0UWFuOk2/gbYsIbZJJjY4Upx3qq7SXyi9e5u6I92QyxpB/z8gAx/WZsqlVbPQ09jbrUGnTdnkQhhgnIlKspGRFG3aKfCmHVd+0jNxDMzeRh8QfCkKxVWRdoG4Ziv2oApfkPF5U/LGqVJNVn4l8elfWnUtMK9KDzg02sVOJm8goMIvtOsa9PVQyFngQBlvVNYgbLuObotuba91URr3HYu+K7OGBvhf/cxvbhHpGKhQjsCTF+9XaliCov6EoUp6Lz9hjWVj/gJG50/9Lt9ZDNkGCRVrH9sA3NEzSq/UZ4sNAcVFjFQKMv09TuEmwQsdV4d0aeWXVdTi08Al5olaXwshgBwfUdc95hAYPDghDTPcshqP5KmxZLxGOf52NhSZWhScLLvTp330FRaUSRDLl6CaKKQNaQehsBwKZAbuNJWC/GwgJmpi67QpeJIhaYf1oK/L5ej4PB0PyJNMP9Ys5SEWaotg4Z4DXyi7gnhjuK6Wp79rIxdtg2/4pO/8TLTsvxw3xOrJEVhHcHN+l9Hy+h7ial6uppQg6YtpfxvW7e1KavZXoz7ucyHW1AtO4vdUNyWi8q+vkfJ5jDCvJLS3qwkbu5TVOVWI4yJVeWoCBJ7CucmywoDitP0pClkJ8SN+WPx0QlvSmg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEFvVmJlczEzOUwvbm5HTi9BM1Y4NkJqeVJ3N3NTbHo4dUJxUXppZTZPc3dP?=
 =?utf-8?B?bzNvNTNSSm1scUl3ajNsL0ZvNGxFeWs3cGt0dCtSVlFZaHlicUhodTJJSEFo?=
 =?utf-8?B?VXZHOVBpUTBRYmVMNnlDRFlOdmRDeFN4SEo3RERWL200R0xLVGFmUFZwWk1P?=
 =?utf-8?B?WlNEeTZ4a2dHYzloc1dSYVFJbHJoSzUwcXhvTFh5eUJPbnNLeFdVcWxaZEY4?=
 =?utf-8?B?eGo0RnAzekF4Y1NtS0VYdzJ0UWQ2aHFJS2dTczV0K2srZUw4TUFKNGlrRU5o?=
 =?utf-8?B?Y1RMUTFzY2NtdEtkcnVXVUtPVVJGMVd2REphdFN2NjBmS0N2U20wKzV2cTBQ?=
 =?utf-8?B?T3pKeHhUWENRcEV2WE5FYS9pWDNzeW1DL1pXSFNQQm00L2tBOGhqSk5QL1pN?=
 =?utf-8?B?V0syVkZiV1dvR2ZrbE5VMEt0RFZ1VGlVckMvZG9oK0Q5a0IvLzRuRE85OW1M?=
 =?utf-8?B?VmhxZjlqMFArTEVvSWhhUmhVWW1ONGQvbXl3WkNaRTRUZTdLaG5GQUN4MEVo?=
 =?utf-8?B?L2pYemJ3c0U0UnhiYUN1MjE5Vm9QWDkxNFdYYUUvM2tzNzVjL3IwT01mNTJS?=
 =?utf-8?B?cm5VVUlGcldDRDJ5RWdGYlZxNXR4eGh4YUd1bTdiTThvSWxhZktvemxUdEpG?=
 =?utf-8?B?Mk93VmlNQ0NJZkwyZkIwYVpSaEg2R3hERFFWaHdGNWVLakdkRkdDSUs3VHU4?=
 =?utf-8?B?Znhuejk3clBJcFgrMGthZnlZcXpMQkQxQ2VPMFFSQ1JvaTVxS1Z6L2NFa3BM?=
 =?utf-8?B?M2k3M1NseHc3Z0xBMytCU3dLUVM4UjRvT1pRbnJmU0Y2cm01MTgrbFZFb2N1?=
 =?utf-8?B?dkZua3o1cGNvWitDYzZDdk9PcU9FSC90SzU1THpCTkFya3ZIcG5sVkI4a1Nn?=
 =?utf-8?B?M2Q1VWtKT3QxMEV3bDlOYXVYUFpsU3I1VVpxaTRJekdveDNRQVFjMk9iSmhi?=
 =?utf-8?B?RlR1d0VRNUFFOTZCWHA4UHcvUXJlSTZqZC85NkdoQkY1RllzbkM0NndhRzJk?=
 =?utf-8?B?L3ljQ0VOYmUvZHVOTXB5Z3NGRFZWd2FtbFR0aXB5U2xNOHlrTnZsdnNXWC9s?=
 =?utf-8?B?a2FjaFluOGl1NmJYakpmK09MeEhVRXdTaEM5dXVGNjlMeWJVSFN2UUxLSW1C?=
 =?utf-8?B?bWdldWdYd2dtelJLNytnbjJ6L2FXTGtlVkx6SmtYQWVnRklpVlZjRG9UeU90?=
 =?utf-8?B?N3huaEcyb2lmSGIxaHFOVGVQbU5sYmlaV1FzNzJBclNMMTluL3VDbjVyN1dh?=
 =?utf-8?B?SWJ2UVRHTVZtRzVla0JTdlU3dElsZk90U0ZnVG1tYUhnL29UemltSW1uR2p6?=
 =?utf-8?B?NTd3WndrYzUyclJRdTIrcy9VdXV0cTgwdjhzQlh2ZVZncFZRNE5aU1RYK2l5?=
 =?utf-8?B?RWFSclVDcm9ZcXJmUlNPVHpNbVhhVUdpZnVJOUE2Mi9ndVBqYUo5amV0bnIx?=
 =?utf-8?B?R2xVM1cxOWhycFhpNzB3RXdXeGViMlh2ZmNvbzRjKy9Ud3ZiYkJCdm0vRmpn?=
 =?utf-8?B?TFEyUXI0WDl6MnRxcWJNb1p6Skp2YlROZmprY2ZGeGU2cHA4T0RSb0RXSTZo?=
 =?utf-8?B?dnRQNVZhYU16SGo0SVNrdWxNaGZjZmptMmdZU0ZhZkkvTm5uMkZaT1hpWmlB?=
 =?utf-8?B?SnBwS2J6R1hNTW9ta0dRK012Y2VkL1VWYVg2bmRwdzdjTU5qOC80dVVORFBp?=
 =?utf-8?B?eHIrdFhJTFY1V1VzQzdpcWhBTzVWZGNuM2kzOGs0eE5CVzBqR2s5NlZYaUlP?=
 =?utf-8?B?RzBvU0hPZXRTTUZQOTdPZEw1Z3ZEUVRJaThYSUtaWkI1NURQeWFzcmxCOHJv?=
 =?utf-8?B?UVE4MDJzcEFoRHV2bHo1QVNocHhWbVNGUkhZN3lIZEYxZkpBZlIrQm1SZG9m?=
 =?utf-8?B?amtETnF6a2JONHIyWlFVaEh2cGc3dkg3b2ExRlFhQ1VXREtMMDRwdG9SL1U1?=
 =?utf-8?B?QVpUcTJJNnByZU11UkZMeVFMOEluQ2s4ZkE0OS80d3cwTkJ6L1h3a1hQajRT?=
 =?utf-8?B?QWUvc2xUZmIrZkIzaExqZmIwaVlhRWovVnU2OERySklLblhLWkk3TGIreHZD?=
 =?utf-8?B?Vk1FMHFVaDloSno3Nm04MnZrbWtwYVJBNGZCMlVUWU8ycjJGak5aTnBid2Q0?=
 =?utf-8?B?SEZhbTMrNmhveTFkSVJhVXVvVm1FZ0wxN09xYXIvSlFXazZQNjJScndTc0pq?=
 =?utf-8?B?OVNlUThSSXF0cGZMZitWNmV5NS9iY2dNcmlDMHlaUHl0cDgxWmIwZ0Mvb2I2?=
 =?utf-8?B?ak1BMk1HODhTelBZbm9md2R0bld0TzJGTFJYaThkUFJJQTdwZW9OZHFDRVM0?=
 =?utf-8?B?ekltTjZpNGVoeXl0M28yR3FCS1JtOVUydFVmcXNlUlZGSjV2OXNlWnZVcjJV?=
 =?utf-8?Q?rZLHUpPz7nBEmVpXu+t6K2xv8CyShVcnkSnKr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 748976ea-5c29-4980-8f8d-08df14f786c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:09:07.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+DL2jstkkyUAVLcxCRm8ZbOu6nSaNJeNjQXSJhj62IIyuiVsjJziHZWte2odpA628Z4ZHlVRipH5TdrHSBIyj9PPuv9rQaCfC4jG2vITdleDjgVA1jpE2oFjEevIuTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709

Add dmaengine_prep_slave_sg_context() for consumers that need to pass
context value when preparing slave SG transfers.

This replaces direct use of the prep_slave_sg() callback context,
which is intended for DMA engine internal use only. Mark it as deprecated
in preparation for making DMA engine internals private.

The only current user is sound/soc/sprd/sprd-pcm-compress.c.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dmaengine: add dmaengine_prep_slave_sg_context() to wrap prep_slave_sg
      ASoC: sprd: replace direct ->device_prep*() calls with standard DMA engine API

 include/linux/dmaengine.h          | 13 +++++++++++++
 sound/soc/sprd/sprd-pcm-compress.c |  6 +++---
 sound/soc/sprd/sprd-pcm-dma.c      |  6 +++---
 3 files changed, 19 insertions(+), 6 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-b4-dmaengine-prep-slave-sg-55e8653077aa

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

