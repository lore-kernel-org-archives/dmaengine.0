Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617257;
	b=dvePTAC1r0C1/2qrSI+aMiAx6VQNj5LqH2Sc8v2Vb5v4tkWOkuEI+QHsWOfRfcXmsAsx
	 Kp6NWkORaq20IBPtTYBvxTlWnRFsky7GDU3JMQJUL8WCH0Nv6hUDQjFJi/XE8ReeZc+Bu
	 Kuw5hVTj1hz3jBXSgmpbLvcoAXeug9aR4V/5SkP9rxM891tmncIPUt8ottBFaFp3aKlPI
	 ccu+2nxZXmlZaVteRhTcFl5ZXONtnJbhY5JoYlp+zNKSqOLooExmcgfSwGEAf0vs+akM+
	 82Hrf4Wk7uW1tUaj52X2SkL06ORJoK4zytbi6pxD/D7Cb0zAvFAEQQ7iSf48Kmyqmmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
	b=KRiaQjuOLzaEoH+yHRuQhRsH6aqrGk8oFG8T7fZ70iCe2Eevvnk5tfIuWkq2jzbpFZyG
	 IyFTQpU6Qbpmju2JnfCOPjEDLgdEwtwTcQnhMzrAYq2ccGMc9RzH3seKh9RaCk5z1/NEH
	 OcBB3JIwQasRKSXeFn3LKqjiSCG89TgeFfb7PgdRQiDvdS8jq1ZemWnbZgn/giwhWHBYq
	 wl/0Jp1kjFjF4t06BSMW18qN4Jo9EuLhAtzKV1QjiLm9MfNOCaFZmyzxJtJFMEGT+lPRZ
	 ht6XxixgAHsLUdEBFPhuBlyfjeHQbjdkNEZrgSzDHLdJAPhGx4whDQUSYF+4zW1LZ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0RrRN7k;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82CB606A321
	for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 21:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N0RrRN7k
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-81b54d0cb17so1150651a34.1
        for <dmaengine@vger.kernel.org>; Wed, 21 Oct 2026 14:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792617256; x=1793222056; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
        b=N0RrRN7kLqeumRcuqWWY2sl5APdSBrPY+QardQIwRIQEvXa1e3gVghGObPs93slqfc
         nrF7sj7Xl9bUMqmJ9i60h3mqI0czWezwStNm2x3/BvnhjLWOGRlaXWujmJUjbWzKiufm
         sP0xtmoL4YZIpF0cxHaUqIjbj/nY1gnBWlSJ6VKKJNda7M5CR7Z7nZo62ipEvAvFjJzm
         aeo+fhrE8uCKn3tPp/ZObAWWTJqO01tkkIGEeHLj2RmzTRVxlpvS5D+mpjS7wRSaiquw
         igew441wZDFA/HVeLM29couMYN/rZCSWTEC2wSf8dekLZhvLL6Oym5Pi3AqoOlLhPrZ4
         HYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617256; x=1793222056;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gVLvklBeqpDEJhUZWbFbh0uj5Dr9BjVDw/1I6zYYEUA=;
        b=ruUl+tIknQorc0EtKUvW3hX81KrXwWjj7FZ4Xe43kpOqwPwt8Qqk+GD+F6wjQPrIhO
         9PIE9i5gHjuOnJZaDLJ+qHPdWp97VZeoo9ZpsPDwEz+9PTvYqMeHwFk6khiQYaB9ofEM
         a43filANJ9IUMTq/2pxJSzgZ2E9ZyRD6k3u44Rf7PgCKJyZKtLCN164cCy7CkCB+R7Cq
         t1HHNfGmWbKoNdxNAs9Php9tnj7Z2+Gomb83kc0HYgeZp5v38Daoi8YRvchoGjpbgMjR
         F3coDFYlKN7J7DCc0FL8bUec9UoCRTycMxr3y2kfK634iOMViNrSYtH4D1mHgqclRbcW
         lOKg==
X-Gm-Message-State: AFq9FYLfDEOoQhpNBxwlLnqyFYWGWfbHpUmi8V5Bc/iVhcFrNOV5AXhk
	u5oN8QCOP3BZBRGrdnpCmCv47Ht9CtticnG0isnU4qGi7XLqrMfL4TzF
X-Gm-Gg: AYBFou1xeRP/H39LoF/no92w01GrDT//JzomUxJXY1C7qtLPBaomZAa6+nTPN1GaB7+
	Y3SZfMTZtOwk9tWrD6OfbnCUQAcXTWWjBqW7RrOWFslmVCw4YsSIxLP8GFMSIGg3DwODxEa2+Ch
	RNGHhXjMj+mGGOn4jRE5yW6lwvJbg7pxSR/dviwMKLZbjceZYWuWJfiJy+BScJOfSYNSpeNbOu3
	AItZETpEuoo5DMKtM2gYwqgvx5u7TCxgAWz9DSHuUoVmhRaANfZR+NFhOY3jGaBPLuYpRUCCTnl
	UsXYyh2MuY/9TruOIZJPT8oxi9DwEexMwjCTdcqKXNd8LADG8B8xjKpRkLAXDuW25RTmPMgdLgd
	N4JDfMx4wHRXVpjOI6oWkGHZzgpJLPomNp8H6VbPdW8J9MEVvl8i4rwq2W11h5snfJ7es0yLp2/
	sLxP6YWYwmirvCedjixGcFBDPu8VxU7hSDDiupyq352YTlTduvrr0tTtuuvyfANN19uLODr83v8
	h1N3zw7LJjYi6taGmHPQBxaMIe42LnnQx5ujlSx9+qVyAXcljc2kqqayzcc8bjgAZ4wicAXXPAD
	pZol3C3Dj2Vcg2CZPO3/yd/SYI0DAjHtsQxXoyy4wo4aAddMIo+9v90HnwiIf4riu113TqvhbuB
	SvsqK1FMZKJzq2ASRO+va74s2G0vOldqmB+fNPg+PitlZFVmSD5Tlm+NlmLaSM2j+JqCgKjeRA2
	OUTm8=
X-Received: by 2002:a05:6830:2409:b0:824:df9:975 with SMTP id 46e09a7af769-84d09a1c6afmr3496970a34.29.1792617255998;
        Wed, 21 Oct 2026 14:14:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d453bsm3268641a34.17.2026.10.21.14.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:14:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:14:14 -0600
Subject: [PATCH] dmaengine: dw: synchronize completion callbacks
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3Q6CMAyG4VshO7ZxW0QTb8V4sJ8OakIxG+AP4
 d7t5PBt+j2rKpgJi7o2q8q4UKGRJcyhUaF33CFQlFZW27PR1kCZ/UATxBfEwUH5cOjzyPRFWAx
 g2+p0uqRoolNCPDMmev/5231v2T8wTNWsH94VBJ+dMPUkJnJHjMd9t20//ZKOjKIAAAA=
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The controller tasklet can remove a descriptor from active_list and
invoke its callback outside the channel lock. Terminating the channel
does not wait for that callback, and there is no device_synchronize
hook. A client can therefore reuse callback state or release its buffers
after dmaengine_synchronize() while an old callback still uses them.

Drain the controller tasklet from device_synchronize, outside the
channel lock. This also waits for callbacks on the other channels
because the tasklet is shared, without stopping their hardware
transfers. Clients must continue to exclude new submissions on the
channel being synchronized.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index dd75f97a33b3..eb3f5ce471a2 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -965,6 +965,14 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/* Callbacks run outside the channel lock in the controller tasklet. */
+	tasklet_kill(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1321,6 +1329,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

