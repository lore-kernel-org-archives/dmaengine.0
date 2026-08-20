Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021129.outbound.protection.outlook.com [40.107.74.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A9148164E;
	Thu, 20 Aug 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247297; cv=fail; b=pG2RMLdETibBv1UV0VaWzkOUTxFyjAhzqVQb/f4sBQXOj/rkZ37tjpKTAt6PMz70kQCJaqw83iNx3uQOx59fSzDMLvU01S53KQngLGmPGpjjDaPFRCV4ejX5jmFW5F+szHMVCYD/qhdJldEWPBnLBuuiv5h2VtjZAD/+Gq1+q5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247297; c=relaxed/simple;
	bh=rJuUY9hk/WT/5cY6l1pAMIz4BmwufkZSquenIEilBnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JUtWp3F9h3GM2Xucyqi3iB5QDdRp10hmWGlsDm2TRyqYSes8B2+Pr6CsfEn8Yk7DorsUjL07qWTEX1ImXCVrYE2UZWU0tb3rzasBXx3XcrVC/9jw5apOsYJzFb5HFtKQwnm6XvCyPiBPMe3H5pfVLq7teoFbfb6DY8hPRW7DpmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZH+QM9xZ; arc=fail smtp.client-ip=40.107.74.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZH+QM9xZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wl4p+kmTIjnov99Sms7SoSUvzQoqqgCvm3kCLrgwuifgRxOhHVKqt+ChcJmzToYITRnwYYOKqGcr+e0RJUC5cVQFV6Y2NLx4VlieuO5tS3T0sUqNXkMFbDrIqq4HM+yNBnCR2QSk4KwchXav+a04+IgtnmxNlKc6uvK43QRfsnUhSVmqBax0UFpJKmUE0Po+wHPwRzVWsEHYCGL/bg052ag4zTbfrFpyUxmz89dL7ve0w1D5Vy/Octq9zIX/iBozidLOjInDsJFciJLsC95GN+6KJmB/o/1aaUPQBAmtkww5IE23rdW98qnv+V5upfYW5fgUYZ++72pwpq4z+TxJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oepf5wfZsPBDsLX1Bz5i/PHdZaJ5tzCGJjco6VJNYtg=;
 b=pOPZWyXuHDmHIZQZknQeuaB4OUECPl8+/AfnxQBaHwcnqAtxJSv6raXcJt3docI6CyS+uIOoKjchETygNxp6uy08OuoyWbPNv7onRmJW8onO740vnqRj75D8VyJ0Rqp8MoQ/u0gMGtjtxeGx0FztMlvs1vveArx99dgbwKK4QUtFhXRpJztiLrkywSxrRR4Mm6raOyyUDzCzkVYD6ChQ+KFfoCdarPt5ARLF2yc8K2no2DoCH+DLtC7EpUYNtGTc1SeawodzmTxsRmBvdK8Y3AJKzlZgv5UsvObp141dJaScOu1cLAnTjestR2h4woF/jqihyJ36WhzHInB1+xrBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oepf5wfZsPBDsLX1Bz5i/PHdZaJ5tzCGJjco6VJNYtg=;
 b=ZH+QM9xZP9RylqAo3rJqXaZa7O9l+LGighSzu3OGGVe/HDHNiIaozMr5jMhJsMMlzXjtFfaxCm+lCb/ORKc96jDUhvs92zVR2Ty1QHtiSmBuJBjg/aGA6DQ2STdtd0gQaiiU8CxcTNoAZgHlg3n7TUOHzAM/w8JEFytixpBNZhs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:50 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:50 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 07/10] dmaengine: dw-edma: Centralize LL doorbell decisions
Date: Fri, 21 Aug 2026 02:34:36 +0900
Message-ID: <20260820173439.2004068-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260820173439.2004068-1-den@valinux.co.jp>
References: <20260820173439.2004068-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be91481-a8f3-4be3-0ab2-08defee15646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	U26e6pmOmC75xd7CGdviUOMQRuizepsYysWY+im4reR3qhrnigAhQS67uWnoppP4Ozg9xZdWY3uRuvxzSnZVM+fZ+4vnzhSXXmG8UlQ/FE8odIo1/cP04OZz++u3Qac+seD9rTc1DqdSDJfEqcjM9Zba2nQAaGYF1eEaHj6PmsONTQ6+i/Xbo4tsNI8xqXwibzNk/uaULoGnG3hz9LKtLO1i72DR9HfapTF2iH+oJsQnRvJs8/RJHO8dDBSTPO5QM7FIbq4A1Cg0hhs5TsKbhhn7dNT3Y9EDyZfuPsP3dPTfK+Cat+IyfGc4ygNgvCTXz+zF7hpxD4KN499dB/Z40Ehyj/sUDR52Vmu32+7s4sIbmTzp1oqldAuZ1xRLaLpi6mPVlcpMmwVBMNq+iLGrl78QFEriDmNMjfMlGwZk54jm6Bomh4vxAQqkg7K36ZTMIMcNSISxjG24DbAJjXgyQevNwwe6BX1Kb89SviBh7oB2qBRw1aLV5FZ2bGrUT06h4OZqxPXCxOkobcr66tDTk++koSbXUqKzIhPxnG7WO/VL4W4nDSWk2iRqse50JT7w/3hgtNppQxpgcJFyy0RR3UIs4p294MJ0n8Il5a3KoNm9YpP2NMvlRGZcumdGga+6gbvs+7B37n/ZMftYfvWrOVzz+qknrTEAon44SZbFn5bfYl21IPBnrxwIiKLcAVk4YFx0d2JrRQiAJg3/YzMOnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilRKNt7JD8I7w3U3ScZK+18B9SPF+WYBoAzWgxZ8ehLVncQXolpCSA5aTHW7?=
 =?us-ascii?Q?Rm5Fu7YEykG32UO5KDvUN9QXFzAMtnrJjMcaApctkO4RcFDa0YAru4Xozx92?=
 =?us-ascii?Q?uLmmBuQvUsvubPDAyg8IiqU1EIxIA5w5NDZZyHy0KUxdfJhpJBDTGjZ2tMUc?=
 =?us-ascii?Q?DA+U7T6QzTUeNLK/P1BsKheF/2z4uEnSmxhQvFFZZpO9NOv4v9oRxoW7xYGr?=
 =?us-ascii?Q?osSvo3oFo8YZXMytCUSqDQ1nQJneFRSignIHcloOiklLTQOQaFs5z5rcbPMV?=
 =?us-ascii?Q?YTWOTvasF7kI31pSo4+DRbaFZyNr8xJW7TfThevk+ysAou7m3KH1usm2LY4U?=
 =?us-ascii?Q?Wu7Xc8bsHrR9GUA75psIJaDH+ppEM5RLnhZdqGxMPtIrj9jj8QzTT2cnZXt3?=
 =?us-ascii?Q?kVbsBdYHn7ZdJE23BJX81LkUzxH2FywS+qulcvk8hEiiBmYccypImIqrXW6Q?=
 =?us-ascii?Q?qvh3MEUiomHf3FHmBjNFvlyvI6c1RSCZy39+CGbHRbArIBmxrxBTbcgpk0p+?=
 =?us-ascii?Q?ncMTs5JucDZGsAcX5ayGCHqQjnJIDT5tt960u0hF5xCM0jXfWYIkW3XIf9aY?=
 =?us-ascii?Q?9xDoEU/AWDu0KzCzRRs/RvBom3PeLA/smgDRUIWC0oz7mTo48bDLPo+Kyiel?=
 =?us-ascii?Q?DbKKbameshDCMVBmoDW9rXTYwehXfDQm1uZOygfXzDEDThIYOMkvc7nQdJTx?=
 =?us-ascii?Q?GVgo95UP17IOpp8pwbXYRADouenPNBnTOhq0k646VODoqyKkdPa1BTS9zIUf?=
 =?us-ascii?Q?gbdMK2WCvswHzSJYlqCjfy44v9B/X/lR/ocoOjVALCQuasRzwbkIamv5zG3m?=
 =?us-ascii?Q?iTPtcrb7kGNkW2tlo9DrqScx5LAmOHBcjqQaA1ToXCknNMENekV1KU2uOw3B?=
 =?us-ascii?Q?09QqswFfLQNBfOX2U2n+wcRNGMrRyUikIYZxyHmhT1cYs9dC+DfDrbEDS/tW?=
 =?us-ascii?Q?TfHqgWnrbxDBe5ko9/47WtZvrJb41/9RwStdQpT9lMVgGQtNdUrUZ+tpL5UW?=
 =?us-ascii?Q?a2EYpHZmCWqX10EYdKrCEVLeX13cBKUyfBjshTVhSvAlF0oaBzIQ2TKp52qG?=
 =?us-ascii?Q?dLSz7oBnIx88IdcKUh/WXSOLhtbRGaUM7ZJ9J8BPa3LgGKnslYsIK+TKJu+n?=
 =?us-ascii?Q?SadmEhdYY8Z+Y4tW0MmezK/eFpIiD/Dffmxvqm+u4jyZ1gE1xqrf/HYFBFNx?=
 =?us-ascii?Q?84Uodj8obsJW5DugfA5l1zrVOxGZ7GSW0hT5nLUqYwo0PyTscw/97GEtK0QH?=
 =?us-ascii?Q?w8AdNka3851jvpEJMDeZnOUS5BIdubbE3wMWZB8+MyMrbGCpJ4+JY3FYZRBi?=
 =?us-ascii?Q?ULWtfzAhJeSMqhd5w6m87E1o66cPbBQ6L9nYc2SW/3W7XzsL9o5mNFDoKxeR?=
 =?us-ascii?Q?elu4oMOPJo64NInY+6l0WcybdlokVmB79MjOjjHYJtKTTVA78oxXCwCw1hHz?=
 =?us-ascii?Q?IXMYjBwCKPvNWTGBU+fVJMpXY+0EMLOBTF1tI/ATjhj/wC7FG5HcdbL/L+xV?=
 =?us-ascii?Q?BSrDLXCcm/vpsEpR2+OPCC7qRkjRy8vLky+1dIMUD/AFtCEm9lFvj/2X8MXY?=
 =?us-ascii?Q?qdV23jijRLKNCEbwdv3L20TcMqmIf7X0kR7zYk9wGnr0cqbWGt42WVulhhIv?=
 =?us-ascii?Q?YbTRjsRBnJmpl4+CG4RcU/WqgqG6vVCkuC1l5fDAgjRydjqMYN65RNYPiCUh?=
 =?us-ascii?Q?71PFTM0yt0+tdS+Kq4PfO0TjXxfgypC+fw9CilLxqA01X4wrleIrg50TOhAk?=
 =?us-ascii?Q?YaH3mkfaj26/m+HrdC3JiuOPiwVAb/IxV2R8lPQHVltfUv7zh+SK?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be91481-a8f3-4be3-0ab2-08defee15646
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:50.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnU2a8gEGpgw1b3Z6yBXjGUSUIEmfOBGqwsnMlmJsY3qS7Dmt0blTz9H6ODHa3Wz4nztvAsfPhrC/RV7Vm+u3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

LL fill currently rings the doorbell every time. A running eDMA or HDMA
channel follows entries whose CB matches CCS without another kick. A
channel stopped at a CB mismatch needs one.

Move that decision to dw_edma_core_ch_maybe_doorbell(). It rings only
for a BUSY LL channel with pending entries, no EDMA_REQ_STOP or
EDMA_REQ_PAUSE. The BUSY check prevents EDMA_REQ_STOP completion from
restarting terminated work.

issue_pending() still publishes LL entries only from IDLE. A later patch
allows live appends. Non-LL channels are unchanged.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 drivers/dma/dw-edma/dw-edma-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 3c1f3f728875..5a8407ca68a2 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -167,8 +167,6 @@ static void dw_edma_core_ll_start(struct dw_edma_desc *desc)
 
 	desc->done_burst = desc->start_burst;
 	desc->start_burst = i;
-
-	dw_edma_core_ch_doorbell(chan);
 }
 
 static void dw_edma_core_start(struct dw_edma_desc *desc)
@@ -249,6 +247,16 @@ static void dw_edma_finish_termination(struct dw_edma_chan *chan)
 	chan->status = EDMA_ST_IDLE;
 }
 
+/* Must be called with vc.lock held. */
+static void dw_edma_core_ch_maybe_doorbell(struct dw_edma_chan *chan)
+{
+	if (chan->non_ll || chan->request != EDMA_REQ_NONE ||
+	    chan->status != EDMA_ST_BUSY || !dw_edma_ll_pending(chan))
+		return;
+
+	dw_edma_core_ch_doorbell(chan);
+}
+
 static void dw_edma_device_caps(struct dma_chan *dchan,
 				struct dma_slave_caps *caps)
 {
@@ -374,6 +382,7 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 		chan->status = EDMA_ST_BUSY;
 		if (!dw_edma_start_transfer(chan))
 			chan->status = EDMA_ST_IDLE;
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 
 	return err;
@@ -420,6 +429,7 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
+		dw_edma_core_ch_maybe_doorbell(chan);
 	}
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
@@ -733,6 +743,8 @@ static void dw_edma_done_interrupt(struct dw_edma_chan *chan)
 	default:
 		break;
 	}
+	dw_edma_core_ch_maybe_doorbell(chan);
+
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-- 
2.51.0

