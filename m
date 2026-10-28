Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219072;
	b=0+OBGzA1kXhy5aZkTP4wOslViEqAtB8QvbP5t7uwEcI5VWZAd/F/QT6vFTU8aLmS7DO/
	 6Z+piK8x8peYMx4SBGHikyG9YWBNHgNWkwIvAp2k7hF0PdCIu/Smaj/NG/055PtLRfC1z
	 9WUoAzvTclPVEtV6/0qCS8fLO/ELazw+/9FA67pG28toy7cl0C6DgeZmIoyYC4JjXrksf
	 i9Zb9OvlDETqZpU3Mtkad1nZzzyhXzvHT5MLa3vWB8dlEcVW2SpNicKuFevMVca17I6WK
	 6RsSzRE7Dru5bI4kIMlR2YEuWi8WTCxKHLaHYnxJOPTJlD2dZpl9VGDzpPLFBDUZsWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
	b=rnSIH2KOt794lDXaJJ7+DAcRK2/f1b2T1vAxdNWPZyaXj0fFACUiILrPAdhUVdjzGT92
	 HvzqZyKfllYF2cETmZ1rjWdrKLXrAYhtBJLL+mZQ1NEtu4zZzc2gwSKRhPC2FXOD7v/Bt
	 kNMdPSt853Rh+4Z5hK+TH8xyWwlCC1W/9Cr0jLv2TlX7GjUdKmRXPpqq6unVctxzWI0KF
	 I5cw/EGAKPQjPzhVuANahNTLAnIftjGQXut59+E1QizYkhNCl+G9LYF6lVAgEpyeb3snp
	 1j9ROgjLmLcCeSIvppMZ9Ek5HCvbVHyygPBbJ+h7xe8QPXqhWfA0AWalLb8iIWf7iaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CUXRjv9P;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1096606A31D
	for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 20:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1096606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CUXRjv9P
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e10a70540so937154f8f.1
        for <dmaengine@vger.kernel.org>; Wed, 28 Oct 2026 13:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793219070; x=1793823870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
        b=CUXRjv9PZSBaRi4Wr5D8+F2lxZ45eA+WHxVPHavMmQwNXaeV4ess/InR84ibks/mnX
         aU9I6nKsVRlRaKBP9vrQVXkJiHjpN1cek6LE3Xix9Y06b8ZWe+QmBMosbkVgJCCf1LQz
         Sb/cpp/y5p15sN46rRyYK9ZwahZk9BPH1tjoacBuCjdRipjylWbNrDmF8qVwuhAlryI+
         GVyclxvFwoJ0lUd9cCNoxYGp4QxoMDq1aKRq8lOSWgfveIDS4OIa7aQ1P9jYjR7eVqKa
         LNtqRjnGYpJlK2m4ofSEkTGYlXQ9szu4c4akgBBTB7irBAN5yNng/GEjJuc+v0i+uUsp
         nCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219070; x=1793823870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZO0llYPU/YEOMtaIxYJKySzHbda7jaK+nmG1BkJ+Z4=;
        b=Oiou/60lFci/YpVKy4kLwmD/Zn/yxTzH2Sr5R7v1A/0kjxFgu9bPpSFlb7U33yG7DE
         s8x3XZcrMUx3dfrRVfi2hdALtOEmsV+2dHPVB1ZTTwEQh7CvOcGUw4o2K2asbrDqxhlr
         cpW7D/RsEKIMi4nJJg1tG+wVDwgE5R+7zTnYM9yNwbeXGoPfce+ZvCMEm15VmGgcQnXO
         vxO98kwuLdFlr3Qze6PjhUMGM7ah+jf7HT0V0anuUQ7CMnf8j8LYc8CBeLnxTIzfKsrq
         XY0z3u+3Lbb8TKtmpt5z463D5b1XDiVWPaloEjhZnqvkXP5FUyDTRzjHe4VTmYMyTOib
         XGKw==
X-Forwarded-Encrypted: i=1; AKwUvBxeRNL7rVWgbWsYsxnzGzNc3AL0O1iCAeHPHXHrgGlfiV4Cqt1ioYzfrF1xPjHlQKfckAIM5E+yT2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbRdIiagjRb9tEoYYSgYJuZcTJZ80DQisyW+N3Ve23QgVAGqTi
	d9teYYkTE4fe6IfJ8PvLHtLBAawcmJb91f/7gk2ePsfORO00ilVjNz4sXYnMHagtZ9A=
X-Gm-Gg: AYBFou1GDxgr9U5s21YOJdHHwkuKQ27auKGrYwJETZq5MsJi+InQBupIC0gvsUBwe1K
	mv4iLs2Wwv7WMvFtvaAUjQvlBzM7JYMY5pOxQWWG/eMdBnVPoJ+CZvD12a9vYfNa/PK3NR3/WSl
	YczvdKN4MgNh6lzdmOjACpbD9z4dnMOxw05CzmkjFi2pmTFGEvqZUHzR4TBpa1RCJXHM7jI0LSz
	Z8toGKmquFFbfzUQzFt2vxwZMuz2nWeu/CcyDUGeb11aGCoOIeaNcogfneAoHPVy1FoDtf/67dJ
	1sh7/jpO62bnhfp02tDaWck3QWErFVEfaDrm+hELfIjoecODKvdw7Nkt7kBrvsJATJQcyyTIKjl
	Z/FQIKzO7hMqy6B1m+tODzSkm4j8FY15BumVyszWIEMQfRIc3/A5Th2fWhxIZdmgwhXqzgj4oL6
	PITRMuGkcJNQt/UbzA32C6Y8r3OcPqcM0GoOrWLQUt2ERzOAF6Pp1Y1CeBmRSSxdKRazLcgexe6
	Uols219IWTp5Jmy+0u1vDAQ0x3OGbp4/lqYXIar+2U4LeA/0dmJb3cHc6hLaMc72kaMOuoXPOzo
	nEkNzLBh8AZb2aHcCgGwkOxsuHaGP9yGOdYBBrGZVdWrWnhDh1sN3uVQ/XTQh2TNKN5BaxepLCa
	ci4pDPim2rtY=
X-Received: by 2002:a5d:5d0a:0:b0:488:83f7:6352 with SMTP id ffacd0b85a97d-48e5d58cca9mr9393565f8f.4.1793219070045;
        Wed, 28 Oct 2026 13:24:30 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm28563439f8f.7.2026.10.28.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:24:29 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vkoul@kernel.org,
	vinicius.gomes@intel.com
Cc: Frank.Li@kernel.org,
	dave.jiang@intel.com,
	xueshuai@linux.alibaba.com,
	fenghuay@nvidia.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] dmaengine: idxd: fix crashes in the probe error path
Date: Wed, 28 Oct 2026 20:24:25 +0000
Message-ID: <20261028202425.1144329-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028003708.834341-1-jinli@purestorage.com>
References: <20261028003708.834341-1-jinli@purestorage.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Frank, Vinod,

Thanks Frank for the review and for pointing me to Vinicius's series
"dmaengine: idxd: More error handling fixes" [1]. Patches 1-3 of that
series cover both patches here:

- 1/2 (double free in idxd_free()) is covered by their 2/6, which
  makes the same change to idxd_free().

- 2/2 (destroy of a NULL or already destroyed workqueue) is covered
  by their 1/6 and 3/6 together. 1/6 adds the same NULL check in
  idxd_conf_device_release(), for a probe failure before idxd->wq is
  allocated. 3/6 removes the early destroy_workqueue() calls, so the
  release callback is the only place the workqueue is destroyed.

So please drop this series in favor of theirs. The one caveat is that
1/6 alone only covers the "never allocated" case; without 3/6, a
failure after idxd_setup_internals() still destroys the workqueue
twice. If 1/6 and 3/6 don't both go in (including to stable), 2/2
here would still be needed.

I've replied on their series with test results.

[1] https://lore.kernel.org/dmaengine/20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com/

Thanks,
Jingyi
