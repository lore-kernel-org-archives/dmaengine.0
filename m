Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9403ED3B2
	for <dmaengine@vger.kernel.org>; Tue,  4 Aug 2026 03:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813937; cv=pass; b=sJHzN5/nKoGFd2sbQZSyFn5NL6dJZDYC8GScxD/cWcnqA/ubGVLBWtxF4xvxmVx+5BItWBfv2fbeEOkaGAEuuk/Yb4NrizLzohTIdJpvo+eoy7O1hRKqYIZwiKwSSfgCZ1ffpaA4QKf+Rzd1WimZmYzd/LX4wCVlGMG7jcDuGGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813937; c=relaxed/simple;
	bh=YRWfTYygMiDaRYf/N+nPFsa+h8XrSZ1kVf1TJvI1Slg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NproxzHDt+O/lX3yQDvJgH+9bZ4SIyvENx4EKLIH+mCiDpVefxTLW0vX8XtTfJcyq4PMBAhypH54OnnE4ulKFycQRlqYo0dzBOGwv9DGRHQc3VwLnkq5pHonNEa4D804fDHzIZNxamtoKuP3gVi30qiY/rSTLRR3dcS6cpx6T3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jya2T3nN; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jya2T3nN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d0407aedd6so45535185ad.0
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 20:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785813934; cv=none;
        d=google.com; s=arc-20260327;
        b=TRMUBU9ngLMLfdYM2FUpoV22E+PRNk0cd2wOhfvQL71orIFAzyRlKJBUzfg7u61/F3
         KzHIK5qpzJi9zZ++DsM07QAiAkjJqVuEL+gVZiPBXEpjU7W+JrwqFM/jmnUuaBbcrZ1F
         M5ZU3hPXBSHhlHbO3XcvF1DEvjO+A746D4F72u3Oew1qAyN0EeVHL7aavjavn5z7KRXv
         rMy01+xiUyfUZWxE+/2ydhvLj1bZTIjjBN/VhzH8ruJnustBx6sfJu/66P2j0Y1hs184
         IDG8/e99Im8TgNcTlhVNmsA7YibrQpvh7AZ+qKVsgpluulVdCK8mikY4JE77FrZJ0lz4
         2Q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K0IxDKcEJtdNH0sNNqO1hZku2xFj3I38obhnZ3eQtzc=;
        fh=wH0itz99qVbNKDiVDzb7xtMueBEVUBCaKnO/2xlRHeE=;
        b=LRDIcsNwxYnkBrZa3nEjbKjZ6Bm3JsHqIZ6ARVgWnqZWWr98q/FQ5BES9fF9C7cSHB
         fEjoZEyp2B5VNAlWCRYhpOEd46dvSAy7DKUndzP06BxPRDMCRbyz/giKGjBGrz80+8+C
         Lo3OOziyDBlgztqL6yFvKUUtTn4CTviAX0BEVYvQv5l97qYyIp6xJwzjmQqi/ffwSAld
         0E6E5YlluOjhPtCYog1AMa9x98d2CwhK3hnEgLOVmnJZGozpgHkvLBsN1LFiPNZ8JJ3V
         rTFYGfBzJ1ZwKfDlF6JZkveXbMb/MiqcUx28QMLUT+5QWoXBcmSQ2K45O1LhieGMguQZ
         YVCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785813934; x=1786418734; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0IxDKcEJtdNH0sNNqO1hZku2xFj3I38obhnZ3eQtzc=;
        b=jya2T3nNkrT+EGhuPHH8E7ticIRxG3NKspXzmhtAgzAEftUTsxOfM/0b49zyzbMDSq
         407/3i6CXs3VV5ZHkWg1y7kyTd+jomc4o2PV8wj7UH9Pm1kqbhCAapDdHl2hHA5nI61L
         ZYNs14QsPseNk3W0f9uE0WDp7JC17AeD/BKOY2wd/LrzWAS0TvLFmkXbwFKceAclVBGO
         lpzCz3hQLrf/NjFcEBIl6LCeOW+TTC2sYSlZqq6svvK0G/wDcwYhJrrXkbrmauxmBmiI
         8MqEgw0X347FIIInkRATLlyCs3cWd+gMI9KgfRUFftIhmLUoQifVZ+8ts+wD84vbt32/
         fPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785813934; x=1786418734;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0IxDKcEJtdNH0sNNqO1hZku2xFj3I38obhnZ3eQtzc=;
        b=LDx1/9rpqxOHaFJLgKvAG7tsInFoTyP32l8XcoXiqtJH1JH0mNOa2qtFcde92O4PWX
         ftZViWek3nNW83ykU2k65wEkeD1vVv8syjkX1w41wurkyWpUF/BMw/vocwmElloZFw8D
         zjaSdWrV5vE47p8rVZcpeGZcbNo8sZSNcBiarrcgRA3MjaKemRww1xIqMmGwqECb19Yc
         lBu0M8v8qKh0ctsyQu00tqSRfgwzFiW5tAZj6AaAaGFbI6ZvIszFBmkp4ZGTyZ7nT6RD
         FMS6jfN1GyXv6DGL5JYAU6T2NaAfEsbTKmpv/GkUapoIPmzBExlyMLVqTLKr0/EZfPBu
         spnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZxF10EZ7OTCB1Zo9z9f1DtZagqEkDYQRGh7SGR1LwYoTUH/GBYJ0NC69FDkHb7f0FQALRa8+H5Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYnMU3poKlF8SvKzNzCO3qA/NW+bI+Nm3lHmVV1z+3JrwL6VZ
	1la0wjl+C472Ie48GIhvyVv4Z6hEgY/sRE+NzELbG0V52A7WLwvkwmRuxxy0NMYTrrvVQLCGvAC
	4Wl+yvliwKLiNHUmaPU13JnibyLFH1dd6wg==
X-Gm-Gg: AR+sD12ssAeV8GKrFJMXQLhFlrjEapiHghgjovddUsj9jOQJ92/xSQu3tLBskFFkuUr
	4NO7/XjGIK4O6S+rfLMaG0/MIKdwFSLxC92qRnSbGAkOZkPG+DjIqObtZIx/I78A50MFRWFidoE
	+4ZiSX0TEJNDmPwE5CexTNOAUJJjoYVTuP1tiJ1bpkP1rsddWqZv23AlZn843qkWpoBL31g9fo1
	q60asle+t5dF2PPfEiivnICUOLaHwShia9AihU7Z1QagsSs2gR5uvdE0PAcUS/WRBbk3E+MCroc
	tosWmO4/SnGmUAJDty5QVaXdM02ZlCN0j05VjRj1354tiRbP9TNy1k5LufEhmKeT1QHl4+MGwX3
	Cng==
X-Received: by 2002:a05:6a21:7d01:b0:3c3:91f5:82cf with SMTP id
 adf61e73a8af0-3c92a837b44mr11855865637.46.1785813933920; Mon, 03 Aug 2026
 20:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <57352fd7-fd12-4884-baee-5a90ab403664@app.fastmail.com>
In-Reply-To: <57352fd7-fd12-4884-baee-5a90ab403664@app.fastmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 3 Aug 2026 20:29:26 -0700
X-Gm-Features: AUfX_mx8155fv8K4wj83gkrKpmc24eH5f3of3hXbzvbsd27c9A3VhZPzlJIR-hU
Message-ID: <CAOMdWSJDkzwG96A6abqkX+fm5tsr3hi_XKgKFZh6MoYc9dV_QA@mail.gmail.com>
Subject: Re: [PATCH v2 00/64] dmaengine: migrate channel tasklets to WQ_BH
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> > Hi Arnd, Vinod and Frank,
> >
> > This series moves DMAengine client completion bottom halves from private
> > tasklets to a common per-channel API backed by WQ_BH.
> >
> > The first patch introduces the dma_chan_*_bh() API with a tasklet backend
> > and converts virt-dma to it. This separates the driver-facing API from its
> > implementation without changing callback context.
> >
> > The second patch switches that backend to a dedicated WQ_BH | WQ_PERCPU
> > workqueue. WQ_BH keeps callbacks in softirq context, while the common API
> > centralizes initialization, scheduling, and synchronization. The
> > workqueue helpers remain internal to DMAengine, and dma_chan_kill_bh()
> > drains scheduled callbacks to preserve tasklet_kill() semantics.
> >
> > The remaining patches convert driver-owned channel completion tasklets
> > and update virt-dma teardown paths. Tasklets used for controller-level
> > processing, recovery, or other non-client-callback work are deliberately
> > left alone because the appropriate replacement may differ by driver.
> >
> > As agreed in the RFC discussion, selecting hardirq callback delivery is a
> > separate API change and is not part of this series.
>
> Hi Allen,
>
> I looked through the series, and this seems all fine to me,
> nice work!
>

Thank you. Could I get your Ack/Review for the series?


>       Arnd


Thanks,
 Allen
