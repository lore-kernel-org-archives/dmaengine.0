Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793828813;
	b=ZJdB5vciC+2CSwllhp+LktyVo7zxJTtvTTBGw6E5AydpLK8Kbst9yuwStOx+8GNZhQX+
	 0J+a64LMpnzNZZOV33F3cz27xKllEbd7iFRwRJ3CeNIPdCFLl+QtZriUVlm2H+yKi5/TQ
	 gAeojCMJ3KJ5D4axJ5J9A1okFF8suf6JYj0rU0HbsgLecnx3cPR8g8L+hKRTTTImtneto
	 SqTcxhfDSInChgXysD/uhcFtrtTqVl5CMnz3T3+rAE5YK8xqopcAeaHFjF7Wt6+xZ8KUC
	 +dJkYg1ylaeV0QSouWOWGy+/prT8by6/j+4BurF2HPvwYwP5MV45D3vOg7eMXxJBbyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
	b=NqHDuQlDRtrxKtea/IQJDUlTzcUMQtOC0e86LRNo1cVZ0lhtSFiLfSM6uc9chywenivd
	 gAI5uK4aPnR6G+9XKHB3nokbqNYulgkypxWUbe4513TbigVYEn51OAZKFebb+Z3Ji0Isd
	 1FMwQrSIUoQpAbi5yiGnzYxuZwFjAKvtjurHMX0ewt4gkmMbkNhWnDbrKrxcgnklSGwwt
	 rdmIJ3j4IcQISPO0zIU+7OmsxmMxX7NMTz6YfvPWkXdE9ntU9DpLBIeB0ZQsRF3W4FpuM
	 Lup7ZhCif3YcX+4CZq5id075E1xhwVDkUedWX/PX3R0ok5QogIcO6Te4GLiZ9E91EAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D7606F2AF
	for <dmaengine@vger.kernel.org>; Wed,  4 Nov 2026 21:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4D7606F2AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ewe1JQDx
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so958a12.1
        for <dmaengine@vger.kernel.org>; Wed, 04 Nov 2026 13:46:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793828812; cv=none;
        d=google.com; s=arc-20260327;
        b=MHchK2KrwYZrRx+d7Fo7/USU8BjbgFUgUuXocFo0nQmSqIZZAXewiw32GO4LY/P6Hn
         3iHSzBkj+fFb4zifNsjEsClavxpiPCC3pI8an12vm3zGtQrOyHH5mTWsKvnY0JBfkm2B
         QhEp95GLlfHXQPQ4pI9kil+VA0AcGpXpKo2IbUJKDtf8KMSefINSay6Xtrjvf11oyQn/
         oYqy76BHbgajX8BFlSPC19/8PfCzkbmlFAtHZF/4q/xxE2pxENprrWvOv/bgdy15qX9Y
         MRljalUK0e9izaZyHVcX2rpM3v9RZCN2V4Rl4lsd+uD5j/nQ2v+bs5+vEcxT889OdeOy
         bUZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        fh=8qnZKkMRtr9skmGWPEvH9K+ON37ltWJKnOi8MK7a9Qk=;
        b=p5i9YtO60WWD8Dcw5vSCou7qhiQ6S7fUNV1dR1okpUMvnubDboVy0fmQGWlby+EYZ4
         uGSBG+YJhfSqFyvraP8iZ5eYzwz4vMKV88mn9bp8lMe1K73VybCcuTSZXzAc2KgaRb1w
         SZJMQJBuqUZ+RSwneixFg81AD6+aazU6pBa0JRoV6uV4EerX55BbHz/u6sHg/FBvtZ/M
         Tp3lOXv64iimmiIsVyTLBDYMObHg+19CSFrkL5LxGwdHKMJazeWL7NZ8L8D5t+aLq1lt
         fu0pmKBrYSbY2BBl7NqC1P+5ybAbN0LtyoJmjOK1SMZ2AluwHgJfIFZZhKkGQyysoC9+
         DbMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793828812; x=1794433612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=Ewe1JQDxh/OpRUCdClFd7Kz1BJmW0JX5ObbSRd6Ekyr6w1rdIhE7jMbdYwplY3NCKk
         g2aFJz08a6ruEkG/lNyZxd26EKiGj86XAMxt7uOLgX25eme/UvJCfgY83ENm95r5k1h2
         qiYJWnp7FGT0h/ykL/xzAKDzuumb6PYNgVmBtJDl0E5vVOEJZQlJ5OKiOOGlzhKY7pgK
         V50o3jeKznfmSCKKczWrp32DcUEdqOkaOEbva0veDWOkR9ZHgsPs6Uq3t7MUWVnJtiJa
         abilpf21PQjXpK0rSl0BW25FeskGFNYkmAYeYPtlNoFAo3KDu6Tq85Tc+PymlrpOJMrG
         33OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828812; x=1794433612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNqX6Xay+ojlP9Sd21jk1TVd8hQxs/1bBCWc6P1bX84=;
        b=oSsUGiTeeJP8m1Jr0MT7XWo2Pvf4vqbSLp3LOMhET1kf8piiWWpxbZg39rwEHn0I05
         N0iTOXGjJeXA+BIslRE5Ao9pWWNhUbjSHk40umIq+hIq54OgSls5K7JPrhVGJrNj8Hiv
         gF5IRkq4xFDJvnTL/XVHp4UXCPZBErfQOTYCu3244tBebQ2WBg9u8xT3j8oGKnk46XTq
         hnRQbzDAgKkK/DtwbJucFUSQQvRM3ZAT8+bd5U8id1gEIgyvL3vv8LRUzssorgVA10AV
         5Zl9pE+ftgYgJFQVlmV4i+zIccL7xNaQU4S07CxioA+k6vGO+fMWPv9C5Ri7qRqaU8gh
         G3mw==
X-Forwarded-Encrypted: i=1; AKwUvBzVsjTT3tNAhiHxz86RfeSjktLsy06zumKUGaCBiLcaaPCSvRHmy+VAwwdqO8thHQ7cxdfI5pBjVNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4BRegcjOXLxmk7PtHdtGVPVBHb2vcNExgDq75PVhVelcPX4db
	k42GtV4hNb0aTIsw0fHrqlQHgNYD10gHCHAwJeNLDEHJnrM7jMWCmmIqbLSQKVnw8sF0af21syK
	SLUfvyY4GRomjxXcD9WJN12eTC4ewZCcnqR6ZtXQ6
X-Gm-Gg: AYBFou0j0STcLGL2h5O5M2hj7GeP4KV9Vl2AvzlkpprNkr+H5Rvy9c7hv0LNLazNM5J
	bpG+Fv9uBBTEGU/jMs+8AxIX76ib6py7YYKScJJqwQjdEQjLhxFUVO3mFcNumPCDZkzVYz7vdsq
	+GlQ9yzyFtWmjxr2lnlPVhjqOAbEaeCeAdtCEzk8tl613k24G56vTnlwwznf4oJXfcc1Jo7WkqW
	CpzUcMwPHOXI2NjJoT90pUndnfgyxig8xl3E3R6OPPZpknQpaDdoDw6ujg3vpva8qpHZxqlhHIZ
	HirgaLBGKLeCYsqa12vbKyg9CADcSetyh+UwYcLwsBiYIqIusZfADb9u0l6G8ntuHOVSji6JoMd
	KuryOhE7AXPCKo5N1cWZW6OD8uj+6sfIQS+aHj6MBO4Y+pYdtgIAlpBMmFavFVEOXLx2Gkw==
X-Received: by 2002:a05:6402:7cf:b0:6b5:65ef:440e with SMTP id
 4fb4d7f45d1cf-6b57cdd26d9mr4477a12.12.1793828811278; Wed, 04 Nov 2026
 13:46:51 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Wed, 4 Nov 2026 21:46:38 +0000
X-Gm-Features: AclHuK-hVkemMHCNU3tA_P7qPrbGUQncvgIj5WYJYosiCeTanBP84HUm7Z_PAwc
Message-ID: <CAFgf54pn3=gsB=3zCsr=6xKU7hWtmi_sxdA772vhzdAur=fZ0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 7:19=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform
> to assing the QCE/BAM to VMs.
>
> During unbind:
> echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/un=
bind
> echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind
>
> I see a system reset quite often, looking more into this,
> that seems to be related to runtime PM, with those fixes I don't
> see that anymore.
>
> This patches apply on linux-next.
>
> Mostafa Saleh (2):
>   dmaengine: qcom: bam_dma: Take a PM ref at remove()
>   dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
>

A gentle ping; both patches are reviewed and I have been using this to
test VFIO platform with kvmtool
https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Thanks,
Mostaa

>  drivers/dma/qcom/bam_dma.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> --
> 2.56.0.212.g129ede20d9-goog
>
