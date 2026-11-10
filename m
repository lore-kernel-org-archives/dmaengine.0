Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299088;
	b=xvEskJEHFSHyERZeHoGU9Xq+CbvwgVQx4Vlyt48qWoQTee0Pp9SJE5hMAJYkg3WwHr1k
	 7UFHb7YfXeCHJ3XMvWfxGHQBgzQBBZHS7sfr5SYP0uBE7NP1y2W6HlIHiCC4vnvOjS6Er
	 41zwtNrv2SYweVGe7JmJjFMm0I80+DscTOwb+2LffaBApM+mDrV5Dr+Z+zKoFwgsEIfmI
	 BTQajNbeKSzY8KivuClewj5kbdm6GhZ08VHbOA3DoxsjowphTIqPw5LQJowDXzIyGJY3+
	 YViGcIJHDIfqpzsWOlQPzJUvDA57lHcPcCfE1JNxNoqJf9nxJCw6Q3EvlVZ9AI/qGgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299088;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xvKOC+VUl/jrLsOzltg5HhRop80sahaOo8Lt7fQZuJs=;
	b=yHyXHq6vZSatq6sTJs9ZHZNCB1lHuYrzGqUyCFqC9d0nWP/tIgkwH+c2sbJVdwZiMML0
	 Nvm6wy+d6GyvgATv3ThLAo58iCeQVjOjszflMU+iHhJyh8SPeszKpXd/u3lOo9bCEhnrf
	 yNeNKPe9EjxcpuU8glvC/+wdkJmxF75XhKw9ZTd9KiQL+WskZUj9cO9UluMWbJ8JL9Fqw
	 IZwiha7NgKgnuBNpGA3l5f1a1pF569wT/tmf21hIVknpKPLidLcvDFIDtSi70EFt6O5Q8
	 nhMbHBZtNRudNYvPvVOxfI7Cazcna7MPHkZm06K8IEDL6XzEaImAw0X1berliKrlkHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=bTSbqvsr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.112
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021112.outbound.protection.outlook.com [52.101.125.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750F606A31C;
	Tue, 10 Nov 2026 08:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0750F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=bTSbqvsr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSwA/HZzzWzSf9r02fi7tO1L2eN8oyyk7sOoYl5famcFelZ+ksUH2Gn2E6BUN4zwX76zjEnudZL5owvXqYwiGBM6sftH11Ru6q3xtMCDxYo8j+cL5UQPIDnHC0MJAUXemu6NgsllpOYea/etAYAlb8OlRBh9VIStgVSbbUt2qftx09K5xiT1dsr+GJHy3CJdLdDGn0ueUS9clVOfdUdfE+6YMcef52Bm9sn3w33wMZJhDfyKvNgxCRuGGo1Teku179a6N9PPDe+775vnRLK28X2L98gL8fZ2uY0GZy4azocfPpTLhWnplvEUJ+QRYY2Ugq6D3jMT2DKFxVx0+V5Usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvKOC+VUl/jrLsOzltg5HhRop80sahaOo8Lt7fQZuJs=;
 b=rTdn1lihsg1N16H9lXpwq1knvleN+ADElUORkDySjTQw/IJCUq6wJKKT17EG+cI0uRWVbc5ljQcAid/zXJtYtNzpdpwNRxzoZUwxYTyKdWu/YwhOBQvHnV2OyX+K1nO8p2jc6UtJwJZjjGtUSJP5OymNB38i1OvJN6Qf3VKyBp8CUVn1mxZQpcBv/7Hw8Co7v1LmHFlBAYu0y6U90qwSvFMemssUCF+2NLMzjgAn0YgtzqjIQbAb9YMmAI20KcVkCxqxedHjwKSgcHlbWeV8c70YQ6gmW3fAB3N+Xmm3KzniE/z+B4KExxSiRF4ZrXf1/dNAUDJQ1s/vDcfeqoIJFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvKOC+VUl/jrLsOzltg5HhRop80sahaOo8Lt7fQZuJs=;
 b=bTSbqvsr03UWiwr2eA55XG7mZIBgWBYNHTW+fuOBLOfvW5YA36sObhm8YYA6xIRgPojRdbEZ9q5oo+RYjGrnJh4dqv+vUjKdg49qL9ayR9JRhKxvgCalJzlSDM0dsQsCqMlyx6jCRzSr1r06mM2vuS2VKIk+TvIcrMwu1eBAdtU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TY3P286MB3015.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:318::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:24:40 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:24:40 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: dw-edma: Clear chip->dw after removal
Date: Tue, 10 Nov 2026 17:24:33 +0900
Message-ID: <20261110082433.1798391-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::15) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
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
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TY3P286MB3015:EE_
X-MS-Office365-Filtering-Correlation-Id: b33406b6-f1c3-417e-df53-08df3f0410da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|56012099006|261021121427099003|261021123027099003|261022105027099003|261026121527099003|261026135527099003|261026140227099003|261102130727099003|261028144727099003|261102123227099003|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9RxNiltr3yWgtpQDZ0PTZtGhWt9HXZdUWd6f5PiaQgC+PADTXQtEAa9tWGD8NhsYwE1j1eFX76gTTITXM8HCdtKirqy8itdMbgLIyLWV2KAgBI1UWSGjIUuIjRmXs/Ple1EOttEptBSLpXfRUbYBsSe8/NtuMawgGrTmCpnvPFALORA8mekp1o80oMpywxyNfvKpRuyroMfIl5NR4lmimiRsv8PsgxTq1RZGDiB/kbL1j8hCmMWRa5Gs0MfcJ+c/WhTQ2lktXYlujamrE0O4qt9A0lQ8Mbi7YQUzECS9Ygl0WVz0L1ut5Ew0I7Di30RMO9KKTB7jg2xiD61iww5bFzTfC7XccSphNCZKU3kExsgfNWo3amd2yrVdLyKMgTtFLUb/Bh40eyT7R5jrQ4oiY9W7Bb+ISieWT4bRQyWwMJXDn4pocgITzDpKtfF7sV0rLyXL+mrLi0DpTR7POwQFbRJTDveRv+76A9WdlikFodSdyxovCIqbK68mgoC9PlBOZ7VfowKNkNHVY9/CySSKBDMniv5562H2IItBE8mWFdJupAVPVW47lJxQHVbVxxsRAMI7D6rnrqCUYG+WaHEWcV4uV8salFED1O/xhwP30d0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261026121527099003)(261026135527099003)(261026140227099003)(261102130727099003)(261028144727099003)(261102123227099003)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+umbqkq0W9jy83eqhNrtDxt7UBUU7eiK+DsDkz0S6SbgefJnZ8E2P9m8ZFu?=
 =?us-ascii?Q?3ud+y3VfAR5RWGmJA7BkxSz/c+PJrm1/CuzZi0aRoXlWvNFO5P8YEm5BkGO/?=
 =?us-ascii?Q?ssjS8Ckqrumwv3qBbNV5bGUM2liWNde+aMoCrQZJZ+nlG5gdwJIIidatc2bs?=
 =?us-ascii?Q?P7G9EW1z9R+yNXUS0ryEzpIBc13LuaOnvUmd+IXOsr32tOntQS/UIwkMhlzQ?=
 =?us-ascii?Q?uoMkxJ0xqjwhVJJLU9ngPgLMd9CKk02CZpbZwPVojI7u/UJ+PV1+h64OJjUi?=
 =?us-ascii?Q?aDP1ZvZoum3VQCe/BmUBpSKfe+IIY3pYQffxUH/oQDmKaB5gelr3PEAv+bIw?=
 =?us-ascii?Q?NtSdCr76NaAI7sFcV3dc6UI4xqwUBFIO5y0trRTYg0PPsU3XfXIrcRkP/vHz?=
 =?us-ascii?Q?PTSkGNWSCWMHje+c6PrkVq7BDkktu9xJsYFXdV+XJFfXM9Zon0nGOfF535Jp?=
 =?us-ascii?Q?eFwpKIahTNP2eVgBw1jY/Sal6TaIrPMpvB/OL1Wbe7zWAd0IeiTXf39zDiTT?=
 =?us-ascii?Q?+L+I4BoyQxxZN9UghiCJumuR6z4pJVlBA2Fule9brbGzECkNFH5TlrWsd7JE?=
 =?us-ascii?Q?RQ79SJRNSGsiVAYYppfDKsAQ00KxVbapvXwtE2ZLuKEuaKivh2uFxOoZIv5f?=
 =?us-ascii?Q?TphZb0HglAN9oM52qjnYj3EgFL44mOVdN7WfsxRQYEkNPSpMDicc1Saud6QR?=
 =?us-ascii?Q?/7zmPSzh6tICGc8mRwo8VaG6arJ0W3ULRNIlx6BuQzRW/9wkb7PPWaRw9ixY?=
 =?us-ascii?Q?jQgZwNrnEJtkM18EvRXZk1lNYMsSIq+fYw+txkICySVQa834u/wVU5f9RdTA?=
 =?us-ascii?Q?yNcZQ7YR/GRsIuRw4ZnGIWAkQCaxnPypEkbWixVYvZKpxg52G08448CqyOKO?=
 =?us-ascii?Q?5QpUqjnRkzKOiqMQ+dShgIOVXVYEyqA9SupAmttc99hMVKeCt9ixi+/QW36Y?=
 =?us-ascii?Q?rlVauEpUPxthag4VAE+DiNMNdHmkH7QG34cMZcnbjcZJC0zP0RYyANvVlZWU?=
 =?us-ascii?Q?9ivbUolSP5hyZS1FEftHkbmoORq4wPovXW7Gn8s+Veh8rlbXYr+vjVPhpU6T?=
 =?us-ascii?Q?4mGsJpatkJkwKO3MEqVRTTt67Sc6Eufok7lIedAmLi5w4cVivS9e1WVjisYt?=
 =?us-ascii?Q?kJdXf31bezEWet4Pl49VcfynK2nQoaQhi+YcHQE0GNvsD4lkkN/BhNmiwPYW?=
 =?us-ascii?Q?Vx7c9V9IPhDgRBfgAiknqNj94DAbpdBWcbonkivcmz8JTDpfwmO5QPQrWNMK?=
 =?us-ascii?Q?et0yQGQBkMZns3YL1NvjjvGPCI6ns1XRwNKNSWre6XXClbgxlctS2IfsgO1/?=
 =?us-ascii?Q?Z4HAJ6/RYPDGw6/zIKbzBJPjg2DwphxSsfXBzD//+36yM2HuMcFFnWGtA1y3?=
 =?us-ascii?Q?Z4VBRGcSo0F0jk4vit205duonW0+Fr00AiTBTcoxSkn/MST3EH5IkwIs4u9t?=
 =?us-ascii?Q?EsusCZlXQwnVN+SOtbLSAR1rc8FghT5z0uC/LecOSczFRwAAFKsioY3HPmVm?=
 =?us-ascii?Q?GvNt3xnD1mzNpEtO6tngoHVZIGrGwZb4q/xO7d8NLm61FR9VSimqLvHX9rhZ?=
 =?us-ascii?Q?JcIVAaj763VizyKjTsh7xw0xTWTeWmDAuo/iYZFAYsIDzEnr117QbrIH2RGh?=
 =?us-ascii?Q?qfnBubrbgMt5J/qS+JKbxdWEfUkBVp9mf6AUlpfsZkix8x1Jx2V5wXlTRql6?=
 =?us-ascii?Q?1StGH7SAvyW7KKMp5e+aZSaD/p/PNyDIXup3WTMxe7z9M7GJAiCozDiBmReV?=
 =?us-ascii?Q?JXOWqImtp0pw53pLZwnpHJ48FkwIvNiH+fEzNME3e2kFZ00v5WMh?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b33406b6-f1c3-417e-df53-08df3f0410da
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:24:40.6343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LngK4FBWijuaVuU/UuFVbfe6mgAGwXorLp6LHvw8Btxvcoy2S9K6B9ZPZjMaoVzf2EKGgN/aaYMFfyRipAggag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3P286MB3015

dw_edma_remove() unregisters the DMA device and releases its resources,
but leaves chip->dw set, so the pointer no longer indicates whether the
eDMA instance is still registered. Some in-tree glue drivers call
dw_pcie_ep_deinit() when dw_pcie_ep_init_registers() fails. If
initialization has already removed eDMA, deinitialization attempts to
tear down the same instance again.

Regardless of whether those error paths are reworked, clear chip->dw on
removal to match its assignment on successful probe. This also lets the
existing NULL check skip repeated teardown.

Fixes: 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261022082230.3164834-1-den@valinux.co.jp?part=2
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index d682074eaa0e..daa2084485d5 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -1509,6 +1509,8 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 		list_del(&chan->vc.chan.device_node);
 	}
 
+	chip->dw = NULL;
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(dw_edma_remove);

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.54.0

