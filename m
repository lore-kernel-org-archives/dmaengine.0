Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744786;
	b=i81OJl/G3PkYRaBpAfwQk0Vj8e8ZzHu0KQrG7qNXR6mmeMSy2DGdLEx1leddvFODRtRq
	 RhKe1EPxHhlMSFinH2xCsIGfcJahVWcycO0UCd87AUaI83s8U3wxg9sfQUpumpKWxP3qO
	 CrfVdG3WaUGCdjsKBL9yjJMXhcw1TKwq9Ub7rFG/s41AAM3p/RVQyw84A6ljWybKB9OHY
	 LRbszN+bqhwLKYLa+5Ey+LAT8jK1aDO4VfJmrioZGaDeHxE4fhGQgVjmpf75rs8kWJb4u
	 pvAh80jb9uvtjj0ltnZ14QfQ9R7UvzbamXoGh9ykwM/+MTEX1XwqcomUFJ7lmfi3kUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
	b=eoVKvLYsSXO3gIv+03fcHumqwEHQduB3C5+iuXIRTynf0zMrEC0m0pHkh3J9PqDuIEjV
	 pLNXpubcqg1poa+BGQQUDrLN+Ir4MkCqdRWlqmTLKJjptBtvKHF2bpQ79oF5j0MKfo7ZT
	 aXgejhGUKfFamfS5t9RuH2ftELG81tpsh7t0W89hdWXbvgh8fe7maLlqG/FEtispsljIx
	 pZtA3287j3xgyaDjU+XfmvjtsdknQOjMNfQJCKq8QdC9nm1FxSu7QtWmUtiza8qKujWVr
	 QVj5wVGyHd5Em/xF/gHbcUPZ8JPbdEuednL+ettr3YsZuaDDWAoBQn4aBF4fOxZZzsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhPrm8II;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04066606EE8F
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04066606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GhPrm8II
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-82109f51565so23268a34.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744785; x=1794349585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=GhPrm8IIBrtjPnVeqbElAzArzQ1IWq+ouDe7FcEjHnZV2NsRy4MCfOjR5Vz29F+p1C
         iL5Ul3vDwGGwLDRQ6+I7dZD6LaZRCt/2Vynaohts9U+h0pKPumMuQwZsjf8am6/LepD6
         iwPduU1z5CSM41kp33QpRUqd8hijDNbvoa3EudiVfF0ZTYvRkT+PM5qPNSA7ubHT68Yc
         5m97VSgKccvzKqzNZaP1RocVUnbbyPN1tCayy3BV4BukpBra6IFZsUN8Hjv4ijG+MKZ5
         2ZKlbGHmVq8QKoqJQFr4cNTTU3VKq0+LC0PXqxpYAkpWRVgY5voNHGomx2nkiOE6xDvv
         A9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744785; x=1794349585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xV7K67o452vhJBNNJkVqcceAfykbkpk6Y6a+s1Bbb0=;
        b=iGXD9J5jlmiO5V5ba69QlmVXMuJZe2EWM5u5KAb0JjiUwOAwesH2AkHMy3pVg581Xa
         UFVpbQ6U1YCq5mwK/RDYiczUrEYhZgW1s1H7FfYffXy+etLd5Yr+MRGVZN3QyTrNLEOZ
         GgMSw9JN2V9+IyIQPl5Ih1fpyWq40frahGixCFYmOdBN/1ytje92qo3u3ymCL1WlhGQI
         5DCQmy0g/9bZPXufKfcpKfiUQ7gipdUhCpb5mRU2BwD+GeFKe5lGpgSEGWo+DAkc5kGN
         7ZSaQ4cDyARkPTYmWwqtg7ITIq6X24Xu0lD5x68FQhuUPKFbe7DPRo7V7Qt1OfHIOP2x
         9Qbw==
X-Forwarded-Encrypted: i=1; AKwUvBwbIN3vO3egSzzUe/jk5lOLvAws1kSSnX0haLDJQ35R0ZzQNmm4AazBmQeSMtNnH4lUy2yN30k8clk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/St7j1dzBtLlXwRIRWbCyvZIxRqwqyCIzSkZSJMrTJfeadSBkC
	ZWA8iX24OHLFzMIsgOOumf5CA5f11HTFFBEcVCS6QEWLruYSksdgXB2X
X-Gm-Gg: AYBFou0NXx3Fi66UNekAAttfc/FaXVWZOpkXo0ri3W8Vwz2WQQ6klrXXLJwHdOqa1ty
	R0X0nKxphwD3mCbjcL+PLnfCg1Vnx8GM7SXQNIn4OPTPBXPeaRf1uk0GHP/82ruMEFIzfpBz1Lj
	oqPwlfFEnbZlC3bNPE5nDhpExI9My0CbAM7uQLNex4S8NfXB/Jdw2BYuwKhwMHnToV3Nd54PbhM
	uYqf7FYdbnr3aBa027hPsAKmT2L4hYnrGbFdPLPX0g7wL+CDF1EssrYah1c+Itr/8pVwvdBJLjg
	Y6LQ3/KRAkfOi/JfH9yYNDLQ76ANY9bbN6+P5Wu9CffHQMerBEiU/PEYL/7C8BKVuF9EIt4Bqi2
	3YsTjSaIkG/PdouXpPOVpnNb8vPZkEgUx2iQsekrQXAZK90Jkdp+j+51YSzHRvHM3pyv7B5cUTc
	01pfO7Ll12nyDPW+LPuAMjg1JuHrDKHC1eI/tAbt+sWd7LDib9OjfbsAqZOYNgRiNDcpY23GZub
	+WKsLy2s3fJZKwzh0KqEUJ4JGUTTKEuwBTXGvMdD5guapRQT24dvdCJ1q5LrxiTqKs8h6owN5m1
	grbWyR/I8CNELoXK2IDUoFz5Ku/N1Yzli1HALN5Gd0B95bq4l7KhqmSUeABJbN96pKC623Y0QeX
	k3lImrU8PvP4Lq2elqwb6g1NTb9xsRt9AuYyCBaxQ7ULsWk+MnOno0nP5Gd/Hdu2sUY7McZgA7p
	mG8K9w+oeNFwNdOBwkojW7TZP6yY59rX82Y9A6J2mnGzC9EpyJ5sM=
X-Received: by 2002:a05:6808:c122:b0:55e:fa63:7001 with SMTP id 5614622812f47-5640ddca9edmr10561090b6e.36.1793744785023;
        Tue, 03 Nov 2026 14:26:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:10 -0700
Subject: [PATCH v6 08/10] dmaengine: dw: drain the tasklet before releasing
 channel resources
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-8-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index c602ea01cb83..56a422ba14c1 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -419,6 +419,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1062,6 +1066,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(dmaengine_chan_dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1087,6 +1093,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(dmaengine_chan_dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

