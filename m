Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CF4248B5;
	Thu, 16 Jul 2026 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215526; cv=fail; b=sYhJ+UpWm3DleBt6A1dvS/EkirVAhTyokvWx4DLRiy2c+w4hxCg/8inqPFldYhjCe0EqehYPz+qhI0vfVuUNFTGjSf/P8fZ2AUKC/d0RpIFLCKYl5xIvu0/9DD3EB85oDE5Xy4qYfr0D+4uY8i8JSbbNvmuLxeOMUScih2BvYok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215526; c=relaxed/simple;
	bh=gR/i+canls+Nbdp7y1twKR3dmBEyT4lcFr1gI838Mxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uKvayfEyarEeFdbaOwx5c/zk3RTslZRmCOXwL6KncsTm6WVHqgsFzIK+esc2nqO+VVATOvzzC5nKpRUTsgKF2eN0Nne1cKvjMQw8ynSp7SbLB/3kz5z3x5XoXG45AfiFp2N0D8r9D0uQyniENcmKqzPXUEgcqYRW6KjcZGzIBXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=Lky9qHbU; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="Lky9qHbU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdfUuw8rrbBVPa2xYudT2EZing/ThNJOMXcfFeIMxX+5gx0hFUa4SsegexeMyca8vM61TW3kIk9RkTMbYQ3JYjtFvxoJhAc+gJ0ZrLIk1gkcGqevkOCf6lNmDtyIyxAvyueyoYmoO8gU22iRGljSLFQoklBI+kLkkiJd90FonD7E43EwlAvWQ3RVHmO4FvHoTy7FFfCPUPl05J40EbkyrCf71leOw/aChJehXDDZL0kViDmEpzSvo/U8RBU3RmQ0HpWUqw990MOWTnGsEq6f0u96LefghE6gpE64Y/YuyztwB/5zzdd2xTpulFWGSOYhIAS9t6j4AhoAGAIjMpzG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQrQ0jcWWWCY54LbPpB9BhiJ6NRwAkUYHz7bGyjZxPQ=;
 b=TsgvFBAW6ebvuXKuOnX9ehpKQcpqFzviYPFpUxsI/kUFqBPsV3NsK0wUrZlzzfOYe4e9ayUIVXJqbfK+QRElbgBup2rAmpzsmEILOWwTnAQtVNsgDdB6GlFDhPh4LYWxAzxNwkp6GAQUYMDUTpxNhFqrvmDvXC6TMv1jqjmItAQrG/MFHrRZHXPlJqrnsALR06tXcBP0Zj3oQQpX+7ELXUPeo9LeXKSjMYtTo+1p6rKnCwtOLa7EM0UpC9APtlWkFKT+INV3e5PiaN1TQyTTwzYxvqnD9JwI5Hp1myjU3CCUM+34sA4aYkvpwZsy6gsALhQROc0q86niimwstOeJhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQrQ0jcWWWCY54LbPpB9BhiJ6NRwAkUYHz7bGyjZxPQ=;
 b=Lky9qHbUx5ovBeKHBNKbXh1hzC3to7UB4FM/aqevi66n9zoAqcwiVFFw7ruXBQ30U/AwhW78PwO+IOuL5x04A9t07pQddcr+4lGNgmUr00lOT4oSfmCOh3pHaiBHX2WAfEt/z5oFB9oGQzGfiMC9Z/lbDrQlSpnjsnUrOS6AEGw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:18 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:18 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] dmaengine: dw-edma: Serialize channel state checks
Date: Fri, 17 Jul 2026 00:24:59 +0900
Message-ID: <20260716152503.1747922-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::15) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 352beaeb-67b5-4dec-5106-08dee34e7151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	mHhGU4udijctt+SOq5GxEt+DfcV5V4Ajzm9Ot76D53oebdFQM9qEKXfvbwiSJP0nVEM5LBRePpo21cDscI9/TS5beTAj0KRxK839luaP771gl1yJcimRLvRvtNxa4ZJmvceEB/d41KCWW0R7wg5gehWz+lIfLJJjjYI4XP0Ijerl4OkotKaJPz3dWvJvmkjkOpu5SKU1WlJWwiiD6NL3lq/9V56DbZ2qaegAUxuXHSx+QJzyxk9zwnC27QoCIT6pDPoKqOdovnQjygIpQpiYTH+Rzs51oUgn7UTi7CQs5ffZ3oZOsNWsyXVeLXb9lF5cFiMYWqEdaa52ENRYU2mYzM9Bt61ljPVfqbSKfqjrS866Nsstx0ODPzbhvZEEE2HnQmeIe+qgMUyieHC2ONf8g5ksDfiYkMquzHTWx45PIwmy/10FtggRn60p8JVuS9CXQce/1/CSW3sEQij1D89UTzuoaTZYexSD20nTIxGzMBwGgYi8TIQqI3DKeVUS5wa/B9Qin6v70cKbKiSXi9O+Hez+kAFSU3zPyzo6LIT1X8CkDnakKwLsXlZRr0j32FPobkPXn2RUMwLxpj691ian8vRbVAJ4keKNLiVdn8/gDpMvocyhfocPzmN+IzatsPQiH7SxS97dMUg6ZW2Ynj3pupz6JftJpmqypI/S9wUEyFc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZjZJmn3AyjfbkyPeZyFnVd3Q/iROewmyuafHsKgz+niPS40xHUp40x0Yg53a?=
 =?us-ascii?Q?PgptSpIIrHIq1+7FIV6DzFmQdhUcHoFVURqD1e3j9PcRc+3WhLdszcvPsjm1?=
 =?us-ascii?Q?HqP47XxyTKfn1HwadlDa2dcs5uad3yM6wLJEi4s1IO+uLoONwfvTlJtGPrwb?=
 =?us-ascii?Q?BChxqxIrZI63kg3VAhudoi/EuTHYolI8FLtofpR7PZoQ3Kca/1dTIzqv4KH9?=
 =?us-ascii?Q?hrWsXLHDHg4oVar9IAxHQIkXbqFQf9dX0SCGXM/5AlDL+2WlV+3R2wzI3YLi?=
 =?us-ascii?Q?hPDHcA9gX11Zgln+CastX2pWDobUm5FJlMaA7qII/BoiCT//wAEOCUQ+xF6V?=
 =?us-ascii?Q?vko1Wgrn44l7X2tiaMAfbumNoa2xRtX1QtRsxGesqVPzAetXX9nMeNHeOrkj?=
 =?us-ascii?Q?zvZ2hGbEcYgK+RFHWSMWkLInk5McQo0cD5pFtHIuPCMdwwwzKnp4SPCtnUyC?=
 =?us-ascii?Q?bngWKTYpB/B4q6PlbCwQuT/IgduimJcAgvQHW2gCLXadUjH6AkX4z+HxjTjS?=
 =?us-ascii?Q?Bptx7qNcuhzvrtPCGUBp6Wtns7lSXVAJKZYYdVIURHspe4qj3vNxwWOrgPFZ?=
 =?us-ascii?Q?rH46BWhXtdtjZ7wZ3kYrtxUEriCKep1+XXal2wr1Lalk4/9fAOXXW7/A3bX9?=
 =?us-ascii?Q?jAucAsYGWpU/Uj4K/zcc9aYOdzrIjl8MGICX/USrgMYl0xusY5JlQVsSUsiG?=
 =?us-ascii?Q?ACi3k1kj0//C08aJcYMT0IruMgv9AnNVk1OcJo6OQr2SKq5ZMfBkhaGBGlpo?=
 =?us-ascii?Q?tI1TWfb3QHHIGaI30oV8lJqDOpOq5BLg9Fl1n6KiZVbpfF/fQv1JdLuyWfkL?=
 =?us-ascii?Q?yycdzNaFxCoB86xNAp0ub3Abxh9b24k6puYIMSh+nJc/nNLeb1IsUbB7RB3n?=
 =?us-ascii?Q?yKe8rkR3rgflgeaYJdoOE0TxmYrbracrf/p5f8qNUaAkN3NG4WtmHNpUvpEL?=
 =?us-ascii?Q?GANfOt/PwYoy38JNWU1mOiBQLCfLKPG6TtCTM+YLKFTosfumgePiwD1Q6oA9?=
 =?us-ascii?Q?MNGqbiLHLMaO8I6vOSU8y/MG6eE2sKlcRo9IEpNYKvdsnYAOnPrkiTyyC/Kl?=
 =?us-ascii?Q?I8wKZ/s7Tw6iCFAJI1K25LVph/Bb0zQ7TvQEaWaEGPIQd0oy7uAP2ymA/RD0?=
 =?us-ascii?Q?ZXHA15WdtKfwNkYxRoN3r3xI2h5lJSZyhdJonFe4R4GvHfeoC5npXe+fQr4x?=
 =?us-ascii?Q?GGMAf/BA3c5mQ3bFKdNSbC9pIdpSknNdefFOvlb1jev+zKOaCZ9hDl0wAt5K?=
 =?us-ascii?Q?Nn00bF3Ew9OG5Wso7VrKhL1DpskPdGWCUmvw3dW5MSBXIfubClFs2TyTGLsy?=
 =?us-ascii?Q?BgdnVC7msnC1qXt/0PIHJMW/lBupDKMz/f0SUjhYbFOHn3/PbEVDn+zENDyT?=
 =?us-ascii?Q?uqhqzM+bUsx6Y+UeR6KgqZH0f65C7tEIhA9eq/FfaqcPGMj/OWIROXzz9gyu?=
 =?us-ascii?Q?gvxoA1XwFqVUnlgHjwYImMYQA1LLpG7QQwisNRkpAmgg8EQgNVJOMHUTOR87?=
 =?us-ascii?Q?mEpxfIuFqs5csafr+WsTFQPh58+juhm3QFIuTbh/EXgkpstpAYiDwd9tSnd2?=
 =?us-ascii?Q?dwtAgPxrEWbkx4KOuveDTp6PMMejvX0MBOdTk7mkcBNoPL/GO22OFH4v9IrM?=
 =?us-ascii?Q?/1xFktA0oXuxLLPz2/7X+Vb0q21bJiJ8DNUt8OKqJMi08DykEyt5QOCyzfoh?=
 =?us-ascii?Q?4WaQXJ0Ab1KgrfXeViAgYrJOSp4jeEBSDxFQ2ZsO5l4DHooarxFm+LKWd7Y/?=
 =?us-ascii?Q?QUKYhaC1b3zq0Pf+k4v1U2ayRE0mBGD0bBN8+Nohy5v1Mro9mnUk?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 352beaeb-67b5-4dec-5106-08dee34e7151
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:18.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRMQQyl1gx2rgy8WRgOSpqa6ttkDhLJymUW8sNFWmAqI75LMCey+lfb1+XH/UGowI7pKiNAJWR4xUlXBLYA6mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

pause() and resume() read and update channel state without holding vc.lock,
while the interrupt handlers update the same state under it. Take the same
lock around those state checks so that request, status, and configured stay
consistent.

For example, pause() can observe EDMA_ST_BUSY right before the interrupt
handler completes the final descriptor and moves the channel to
EDMA_ST_IDLE, and then record EDMA_REQ_PAUSE on an already idle channel. No
further interrupt will acknowledge the request, and since issue_pending()
requires EDMA_REQ_NONE, the channel is wedged for good: terminate_all()
leaves the stale request behind, so even reconfiguring the channel does not
recover it.

issue_pending() already runs under vc.lock, but it tests configured before
taking it. Move that test under the lock as well, so configured, request,
and status are evaluated as one channel-state snapshot.

Fixes: e63d79d1ffcd ("dmaengine: Add Synopsys eDMA IP core driver")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - Use guard() where lock/unlock is newly added. (Frank)

 drivers/dma/dw-edma/dw-edma-core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index ac40a832a9c7..64ace6b9ebdc 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -302,6 +302,8 @@ static int dw_edma_device_pause(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	int err = 0;
 
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
 	if (!chan->configured)
 		err = -EPERM;
 	else if (chan->status != EDMA_ST_BUSY)
@@ -319,6 +321,8 @@ static int dw_edma_device_resume(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	int err = 0;
 
+	guard(spinlock_irqsave)(&chan->vc.lock);
+
 	if (!chan->configured) {
 		err = -EPERM;
 	} else if (chan->status != EDMA_ST_PAUSE) {
@@ -369,11 +373,9 @@ static void dw_edma_device_issue_pending(struct dma_chan *dchan)
 	struct dw_edma_chan *chan = dchan2dw_edma_chan(dchan);
 	unsigned long flags;
 
-	if (!chan->configured)
-		return;
-
 	spin_lock_irqsave(&chan->vc.lock, flags);
-	if (vchan_issue_pending(&chan->vc) && chan->request == EDMA_REQ_NONE &&
+	if (chan->configured && vchan_issue_pending(&chan->vc) &&
+	    chan->request == EDMA_REQ_NONE &&
 	    chan->status == EDMA_ST_IDLE) {
 		chan->status = EDMA_ST_BUSY;
 		dw_edma_start_transfer(chan);
-- 
2.51.0

