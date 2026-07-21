Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0552F8E82
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784640837; cv=none; b=RH68gPpv4bXnMdsWYZuu3LKMXcnHM1ga1RWjhxRSIb8Mo6NL8w/jrqfQJgVZwtd/liGeNLeVOI1VvrVlBPA91k1MAq2d16FRrKbzVYbR7KXnwufUUKPmy2FAISka+Jw4jNlxGTxFJAjNCMN6VtYQgLOLiKIBaH/OPpeV7ZtX+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784640837; c=relaxed/simple;
	bh=YiW3qmc2mOtsaItbp0NiyBvoZYe/pqkuxa7R7znwr1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vb5gT4aX8QUPhpC9gUUaZgrpbIT1Rd2esGS7WXXqfcGJIlNRmj7/jr+K4zzwkW3tMzz0H4eRR7lF+Ys7Za1ncy/Wbur45X+8a90guuCT3fNx+Ql5CjEaLonaU22rYvQ19+p4o68efp0Oxzyz2ZcGdMDPwhtQpCf3+FoiDx4Hs+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8bxfLNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFcb3Vac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8bxfLNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFcb3Vac"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM2ki2024047
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0284kFkgULwQK3uLI/K7mHkOyXRENvIYssbFUalZ/Y=; b=Y8bxfLNvlXqpbcRb
	e/Zt52eHfD2PTW6j3x6+O9lQarWLnI+6ueiwjg6TU4Xeb67bhgW1/cJfQPGPFCoI
	dOYAoJ8QU8Z1dCGlJ67L8pcHy4WRWav5ADWqgip+q+Sje9qmSql7NiyfjYVWxwob
	bTuh0GuOOuXTki/GAvXuYk2/CKrz0GBlkWmacelPnJChKEirvOABFKhszypHqOU/
	HRd+hjzGInuriXe9eKRrsFAsxUFSQ62H4sWb5mTZ7WPHByezEmka2UPzs6Zb+k1i
	GDP3uECSpD06V72BkbwLTyr9Wfj5Q+YKS0UqG//TA7Kg8FcGHk++PMrGADC/UOO8
	bI4XWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3gxcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 13:33:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so272493241cf.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640834; x=1785245634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0284kFkgULwQK3uLI/K7mHkOyXRENvIYssbFUalZ/Y=;
        b=VFcb3Vac6Vv/xd7T8ypJg9az4+/hmlEsoZuChEqYDj0E68RcvyqATQg6LyO9pqOj29
         o9aemJ/1m45nVNr6y/GlaHsMEkll3VnBw5lke9z4YKuzqMja2TrKmpj51IHry2LC+Dho
         kCd7SQrfVjl4MgqT7cn8UMCM4EG7SM6UPIKPrqP5wMqIen1pGNZ3KyuIZ8TvnEaTQv6y
         bVosYf8mPm9Ob8fFa15ss/082eVaVUtzUL+nQRvK7lAWywgEdNnohXAo2svs1K+yx08N
         PMrdXNo8q33GPMq+Px2ox/s4j1vsJKKZRVTlZgL0Jbx+lEi/bXkPTuEPRg+8GBTnUy5v
         lP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640834; x=1785245634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0284kFkgULwQK3uLI/K7mHkOyXRENvIYssbFUalZ/Y=;
        b=bRHsq/9fVBzOOVllYcK7XRcBynLs5qs5p/oFpaNkXwsz2Y+C3jlzLUAeGKLx/xMLwR
         1Pwbds44n7c8eCiRigaZu1vouI/BTzhknbAS85IjCkiYoaBKnojVBYISQ93S1t8/kQL1
         Kp9KlW0buVjB12cRYkuvkIzsGmdNmiK1YZUHoGwCy4lb7mbCW7iLIOwq4Ez1C5W/hTb8
         pYznpL7kA5KoQtFhqRGp8nZ65m0usn8bAAYi+A6Fu0YStj0qL/8lD1o0/N7SiIfh/hXL
         pGpDC+6oAd6fujuCqqNsikgdPPs2sI7VHQmcXjIwlKYELAzwuFziqAzdk5PrSZdGzBQP
         X8CA==
X-Gm-Message-State: AOJu0YxqqH2/gIQ/zNWKX42eFDlm8yKpwW0HzNE9Uw59wzhOnk0oxFkB
	xqicB4uDsUrbmRQl5s8cIMNb6kgbTe7O6eaoOgk/lF39VcRXvbmFqyXiMKBGVstw9ahcUnU5J4f
	R3Lg2NYxxo2M2nghRZxntnzx2To2M7PmeIxgwWzDwP2GRBIizCOgb8G6P0kSLxSQ=
X-Gm-Gg: AfdE7cnOG2HyVoUdHTGXiz49lFAg5FiuDW6IroUTP3uYEbBrZpIbCxZD1sseogfmiRx
	kARKk7qwZkZ9IilhNIIZrUfk+9Ep50SrGQ0z779jtw9kwJYmsXQuJQ94WY9ogT44VCrfY/iWTFP
	G1JECp/TWLbTrBUwWwuax14BRzVnV7H8N3YuVayzjOW3QbyOVNelnFcomY2hrlGSQlLB8BKjU20
	seqzt/pFU/WH1CPVZl2suyCqrzPlTFYEEAX4WidMOD9kSsreTbm2r/zs7zviKOWoBIAu9FhQENP
	4P7rYihCIYx/4QgjWZuUQqW797qkD90qGh78u47wNFD+Fe7QLrJMGUwdZEG93wphF4TIJvPI3i9
	vPwdIaUsdbttGGSfIlGgbq5kGAEO0NQ==
X-Received: by 2002:a05:622a:5d1:b0:51c:7b11:41a1 with SMTP id d75a77b69052e-5213f46e365mr172088651cf.78.1784640833597;
        Tue, 21 Jul 2026 06:33:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5d1:b0:51c:7b11:41a1 with SMTP id d75a77b69052e-5213f46e365mr172087981cf.78.1784640832717;
        Tue, 21 Jul 2026 06:33:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:11 +0200
Subject: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12048;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YiW3qmc2mOtsaItbp0NiyBvoZYe/pqkuxa7R7znwr1Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UjLElhWTC6g3ku9JMXGJpRfNs7QUoQcmiGA
 bDqUdmlo2eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91IwAKCRAFnS7L/zaE
 wxHgEACkKwGsmgWPjnKHfj6w44/GG8+vN5jMiPCmG6rdf9pkNvmwoSFToGZ3BkxRv332n/N8iOm
 S2RzN1GvNEqn84uFd+nRL5cuk43IYKiIEFI+Rv8mjH5/776BQNLuPzaO/bp3Ic9pqQ4TO9DIt8d
 hnibt2z5XNj1BNUi4hVmsO8jhj9FD1vDv8iOpfzPYfzM+sc2OzuFN9HETm7gCio575pgpbfGw0M
 6NvDGX1KzooySpXB8Uztn5mgOIWkfFM59ij7GLWVcb6rzToWuLVzGTVyPihJXIPbEgHmysigPg1
 2d/vqrxDUqnCefh5QAYMalWs9rgpA4jM2NPg4X5aTP0Zi8pywwqf14TL0svgraZGmXozzxHL5I/
 v5fjjFRwrZDERt1egTBfifx4zGtgjqudUddTb0KrzdHTcwBsVto1RaGjmaJeZLLZXqwR1Kng0XJ
 pmIIMlNvikhj0P0Ce32Jd5xpStddlLpREEjKfMH2oR5mz+iL0t0SL888jerIowSVCar963QmNkq
 j40t6wJPKuG5E4/t0+6nCksCN62Zb6oyUFfC7fKxswoBcIna9psT1aDHXzI2pzqvSgOhIhmOAgh
 35eI9DSeWYNxSFihlXpek99rsjbq/xhYDog3srwcy/25hdDnKA6xs8UKY+NTaUK/LgtMN1iAYDj
 w4GS/Ee4I9t3YbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXxKlQzDZA3Okk
 mKLUtOUOuspgQN5iNNwDAUhValBCyz2Qimms4PzuENQwv63YeE7ueBmg9Z13fRxTSPonqUOE9CW
 Q2jN5J7NqNaDlnOOQCmy8bhBkyprRaKtqNN0F+hY6xplgrzUUtHL1q21hENZ8cxoUeGMmFNzkdm
 +T+LKFaGDmIRJNRKcFZAxxC3egyS0EZwToNFSB6twqFUZx/m3mo9YadNuxcCtFi1k1eJystc9zn
 YHVFmg5jtNT7b8grk/yVg1I3dPemR36uX4XSycFd3GV7JOpFZkVD8sxwYm2hjF52tNueiEp8Ozw
 2ELg+/X5CXFqCGQ7xOdRCnOABlLz18sWC4Q590BgsbSFw8oosjYvprP2VFVtEyXZrt7IBnWjTlo
 3TQE0fGzXkzs2ySvTVVxB06Pg7UIk6vnWWJLF6fNH6YZ+T8fJEeshXCCeztHkTviWgHC+N1f/+H
 ipiEL5KrY/EIDJzGBRw==
X-Proofpoint-ORIG-GUID: Pt78Kl-Fcqfjv3ZtXFJEYV4lCx4AiP8-
X-Proofpoint-GUID: Pt78Kl-Fcqfjv3ZtXFJEYV4lCx4AiP8-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0Lwuunr34g5h
 YObelNQEcmasMUhaP9u2MpJR9Br7bJHvGydjM+zT7J0aYffcsJt8nv5J5WyKvhYRIGd45LBR6Gp
 pW2KwnCQ1bxPJVF74jfbGJ74DMZRtLA=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f7542 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0mtKZB-VTZit_Rp23UA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144

Add support for BAM pipe locking. To that end: when starting DMA on a TX
channel (DMA_MEM_TO_DEV) - prepend the existing queue of issued
descriptors with an additional "dummy" command descriptor with the LOCK
bit set. Once the transaction is done (no more issued descriptors),
issue one more dummy descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via slave
config.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 173 +++++++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom_bam_dma.h |  15 ++++
 2 files changed, 182 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f3e713a5259c2c7c24cfdcec094814eb1202971a..411c60c4433e21e202847aa9182163a56df2d97f 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,11 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	bool is_lock_desc;
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -425,6 +434,10 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	u32 lock_scratchpad_addr;
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -638,8 +651,10 @@ static void bam_free_chan(struct dma_chan *chan)
 		goto err;
 	}
 
-	scoped_guard(spinlock_irqsave, &bchan->vc.lock)
+	scoped_guard(spinlock_irqsave, &bchan->vc.lock) {
 		bam_reset_channel(bchan);
+		bchan->bam_locked = false;
+	}
 
 	dma_free_wc(bdev->dev, BAM_DESC_FIFO_SIZE, bchan->fifo_virt,
 		    bchan->fifo_phys);
@@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
 static int bam_slave_config(struct dma_chan *chan,
 			    struct dma_slave_config *cfg)
 {
+	struct bam_config *peripheral_cfg = cfg->peripheral_config;
 	struct bam_chan *bchan = to_bam_chan(chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
 
 	guard(spinlock_irqsave)(&bchan->vc.lock);
 
 	memcpy(&bchan->slave, cfg, sizeof(*cfg));
 	bchan->reconfigure = 1;
 
+	/*
+	 * This is required to setup the pipe locking and must be done even
+	 * before the first call to bam_start_dma().
+	 */
+	if (bdata->pipe_lock_supported && peripheral_cfg) {
+		if (cfg->direction != DMA_MEM_TO_DEV)
+			return -EINVAL;
+
+		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
+	}
+
 	return 0;
 }
 
@@ -802,6 +830,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
 		}
 
 		vchan_get_all_descriptors(&bchan->vc, &head);
+		bchan->bam_locked = false;
 	}
 
 	vchan_dma_desc_free_list(&bchan->vc, &head);
@@ -859,6 +888,16 @@ static int bam_resume(struct dma_chan *chan)
 	return 0;
 }
 
+static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
+{
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+	struct bam_chan *bchan = to_bam_chan(chan);
+
+	dma_unmap_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	kfree(async_desc);
+}
+
 /**
  * process_channel_irqs - processes the channel interrupts
  * @bdev: bam controller
@@ -870,6 +909,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 {
 	u32 i, srcs, pipe_stts, offset, avail;
 	struct bam_async_desc *async_desc, *tmp;
+	struct bam_desc_hw *hdesc;
 
 	srcs = readl_relaxed(bam_addr(bdev, 0, BAM_IRQ_SRCS_EE));
 
@@ -919,13 +959,19 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			 * push back to front of desc_issued so that
 			 * it gets restarted by the work queue.
 			 */
+
+			list_del(&async_desc->desc_node);
 			if (!async_desc->num_desc) {
-				vchan_cookie_complete(&async_desc->vd);
+				hdesc = async_desc->desc;
+
+				if (async_desc->is_lock_desc)
+					bam_dma_free_lock_desc(&async_desc->vd);
+				else
+					vchan_cookie_complete(&async_desc->vd);
 			} else {
 				list_add(&async_desc->vd.node,
 					 &bchan->vc.desc_issued);
 			}
-			list_del(&async_desc->desc_node);
 		}
 	}
 
@@ -1046,13 +1092,100 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+	async_desc->is_lock_desc = true;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->lock_scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = cpu_to_le32(sg_dma_address(&async_desc->lock_sg));
+	desc->size = cpu_to_le16(sizeof(struct bam_cmd_element));
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->lock_scratchpad_addr)
+		return 0;
+
+	/*
+	 * Allocate both the LOCK and the UNLOCK descriptors up-front so the
+	 * operation is all-or-nothing: if either allocation fails we free both
+	 * and run the sequence unlocked rather than leave the pipe locked with
+	 * no matching UNLOCK.
+	 *
+	 * Both are queued in-band around the currently issued work: the LOCK is
+	 * prepended so it enters the FIFO first, the UNLOCK is appended so it is
+	 * the last descriptor of the sequence. They are loaded together with the
+	 * payload in a single operation so the engine executes LOCK, the work
+	 * and UNLOCK as one ordered batch.
+	 */
+	lock_desc = bam_make_lock_desc(bchan, DESC_FLAG_LOCK);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	unlock_desc = bam_make_lock_desc(bchan, DESC_FLAG_UNLOCK);
+	if (IS_ERR(unlock_desc)) {
+		bam_dma_free_lock_desc(&lock_desc->vd);
+		return PTR_ERR(unlock_desc);
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+	bchan->bam_locked = true;
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
 		return;
 
 	while (vd && !IS_BUSY(bchan)) {
+		/*
+		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
+		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
+		 * already have bam_locked set and must not trigger a second pair.
+		 */
+		if (!bchan->bam_locked) {
+			ret = bam_setup_pipe_lock(bchan);
+			if (ret) {
+				dev_err_ratelimited(bdev->dev,
+					"failed to setup the pipe lock, deferring transfer: %d\n",
+					ret);
+				queue_work(system_bh_highpri_wq, &bdev->work);
+				break;
+			}
+			if (bchan->bam_locked)
+				vd = vchan_next_desc(&bchan->vc);
+		}
+
 		list_del(&vd->node);
 
 		async_desc = container_of(vd, struct bam_async_desc, vd);
@@ -1133,6 +1285,10 @@ static void bam_start_dma(struct bam_chan *bchan)
 		bchan->tail += async_desc->xfer_len;
 		bchan->tail %= MAX_DESCRIPTORS;
 		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
+
+		if (async_desc->is_lock_desc &&
+		    (le16_to_cpu(async_desc->desc->flags) & DESC_FLAG_UNLOCK))
+			bchan->bam_locked = false;
 	}
 
 	/* ensure descriptor writes and dma start not reordered */
@@ -1191,8 +1347,12 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct dma_chan *chan = vd->tx.chan;
+	struct bam_chan *bchan = to_bam_chan(chan);
+
+	if (async_desc->is_lock_desc)
+		dma_unmap_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1384,6 +1544,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..188f667cad9935b338489e41e6dd03e58166ef9d 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,19 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_config - BAM DMA peripheral config.
+ *
+ * @lock_scratchpad_addr: Peripheral-local register address to use for dummy
+ *                        write operations when queuing command descriptors
+ *                        with LOCK/UNLOCK bits set. This is not a system
+ *                        physical address: BAM command descriptors only
+ *                        encode a 24-bit address relative to the peripheral.
+ */
+struct bam_config {
+	u32 lock_scratchpad_addr;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3

