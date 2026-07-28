Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4140D576
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228477; cv=pass; b=pEEXlvQ8nUkHI7j0XDKjNQvVFMkHKm40TmvOSHFojPAdXNDRLZOBufHCyNxs4yZuOhh8qIEpPjpwMHGsKuZ5cCHD/d0gboJ2FmMxj0uao6rNcB/3AEXkMAcnGYFddQUv0A/OWuXMPwneKb0ZUa/jzz+weJDRkPYcGFUFbERfOhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228477; c=relaxed/simple;
	bh=EvbSCDISdoIvTZvRWKzdAY+aS9TROindLaIYqsAhCRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWB9j3bkoa9MY34eY471C5+xixWH8rdkFZJYjI8WXnsr5suzP8WL9Uv+iGznnmREpSsxenaJiw93R6YHIdRlwhRSzz5yMslB9STmzltpBSnL+EI86E/UkTwSy7woDaBKnHlI/8mU75R8pPXZXD58FNO76p4O3xMiJVCXmLosObY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsfUYcZV; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsfUYcZV"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso4984249a12.0
        for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 01:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785228474; cv=none;
        d=google.com; s=arc-20260327;
        b=E6dZ/fG2uWnU0zTc4zbRuJFxEwF+nNOsnxKZ1HmXoz4QTKP6FUUwyl6vjd9uR5mI2l
         epcjKokFVjPQZdL6Hs6xQ7NDNyAqwJb6BEmSOYLesVabYsYp/o3GHNx/xqWeGYIIsTnW
         hgdrRB8Ep64pwXVVGDBUvFdQS1tORALnThZ0L2quiYeYyY8R7SeuaYp9YM+baVoUmbw/
         /h6+nJLOAn5DUNcR7/f0WLJJuk1vETDAk202MzKfq3bIdjtmfHdFd/5QKCkNI8zOLtB0
         cDKgupLJM50XZqlmBxkLZ1J6SGIF9kTSQDs0WH/6eQ7gKbC88wINSXjhhPq7eWXpxac8
         vPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EvbSCDISdoIvTZvRWKzdAY+aS9TROindLaIYqsAhCRY=;
        fh=PJ1sNCLJrs1yTVv1tKwT6sNHUzRfK4Lho55jsducarY=;
        b=XwKcEPZFI2YNBx9zUlToOSKYTxnFep5jXE2L5GMyMrXZbP2OsXfrT4CazSmimKfAu/
         12/eTlvATZMKlkr8RMgC2ejAg83/3Q0bEwK6AWMi4cRJYoHpXuWC8K4/4Bav7UNLpwxI
         vcUg29mC+f2rpdan+wOzVt+f53yYMrbwSCeq2Ql+QRP8bTA7DQiOf5sv0XA+vRsnzzkI
         e6FrP6gDZtKdJGpFhhSrW2aAcmtE4C1apEgxvbH70F0GRrWQ1RKbnS/eH52MFrkzxT0K
         OM/1H/OTeUZX64SnwAdV0lP6pkbHN/9RBOl3CIT+obz/IRngkwbK3npIRAPHxtxVRc05
         f0iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228474; x=1785833274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvbSCDISdoIvTZvRWKzdAY+aS9TROindLaIYqsAhCRY=;
        b=EsfUYcZVirMai0iDXylRLekQQzZirNr8CihFcJ62KMbf16ZFfKmdXhLQoPaW88tJIM
         64EXi9Ew77T8tyjh851tJUtMqIoJufL7v+vAiCrrydji1vaO1NoXWNYPPl2hHb8d7cPv
         SIQNIJxHzKW/h71QXJQm4jLtA1VxKssy6JY9myd/8HPJCrFAhpoMhUZcosLqKFqiPpux
         uYzdIGzNF46XG0ihJxyccj/CvfxhrQ1hfg3t0GRWbMDsOdUhSP3gvlIxxDeXeHeUPPiq
         JHGrnrB3ueLCAQC4pddkuti5PE/3EEoZmAyF9QcAuoAcyu5DMp7RaXgyB03NlCb3Kg/1
         sHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228474; x=1785833274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvbSCDISdoIvTZvRWKzdAY+aS9TROindLaIYqsAhCRY=;
        b=T5K2z9yqP7hUNH5M1biKH9AEf/qFKLOyY43F4/S8UxEjCETtSTug3plv2XHL7O9LSD
         kitb6naw6GAu617qwHBYeEDo9HhSCx8/wsrm0lJCrlRZk4ik8tMq7BRqvFzsPOR2+spX
         N1UzkmMp0LwDlwtL3t4YrnQN8hwqWXfV0i+Zz0DTmVYfXidAxjV8NKZlxlV8yTeZsiSh
         EIG83WBwzBB3KOUs1vjSvzkgJvXDD10W+onYQrOaXq0NFDowujmPYmiHLRH3J9Vv9Gdv
         ZjyQFrmytZv5cPsqnT+MNtSr3Te4JLsz/IkJ5Nzp8RGB0Zb3BFyG48BNFgouwNF10SRC
         MZXg==
X-Forwarded-Encrypted: i=1; AHgh+RoLbTrWLNcG4vVQxCUfjf42Kno0vSEAMmAeYr/UXKnyPXwr9DgQQT4qph5DMoKo962WFAbRuXtw748=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSy6mbbFPFNTccyieYaYrXu/2tWnLaDkCBQ4GRvK2jtyvwmj4B
	W8o1yTJo2evXCrdAFB74Be98NWzWIj1Kp4Chj+X/aNxWrs4h5S1AAbp9nEXLeIkHYCAqBhEv4uP
	Ri2cD0twSryMtVTqrGP4RuPD8CEMwkjIXaiaX
X-Gm-Gg: AR+sD11IVPOsAvvuJSN9Lzw8tOmZT+osc3kKYP4Z8AfL8+TutfTVG/bDhBh+n46+jWo
	iHCG1e0bCqIZCKLOwtej/bPi7EDZv8jJB+aQjFCXeIqx6OzQV+2gm9p4w/CPWDjhN1v9RKvT5I3
	Y4Uplr0N5u/hskWGow40h0hnqNKzgiLxoePD21lIcs3peg4xcQUJ2WAdGBJHMr580+wZBpWKIJr
	acejTKYds8NCpS+muVT4xryFUWDXtkXAAqjmYbh5eqRebQXlhG6rg3QW45jgUbVy+Ifwm8NavaV
	+eM8HgbZCwyxQdGQcCN39nDlPVjWBFzjGz1JBNWDeSBPb3QSIZ1MjOTU6B+pH+Hja86ENCfFOij
	P8t2er8SVr6fKM4RXYZoGJKRCw2B/x5tbFyQ6lLuEk/et5LIH0P3TCQAibqpMJ69sl8X25oS02V
	MSdGJ0
X-Received: by 2002:a17:907:94c9:b0:c12:525b:4e84 with SMTP id
 a640c23a62f3a-c1f7215d859mr68901766b.9.1785228473688; Tue, 28 Jul 2026
 01:47:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <5fb51b38a020076248ec76bf643825ea9ca81b8a.1785183549.git.allen.lkml@gmail.com>
In-Reply-To: <5fb51b38a020076248ec76bf643825ea9ca81b8a.1785183549.git.allen.lkml@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Jul 2026 11:47:16 +0300
X-Gm-Features: AUfX_mwnrc80fGfBEzFIR0qAiXn21pnv7aT-691Ty9BV_hzkLCj7NLKQT44m-wQ
Message-ID: <CAHp75VfzLw7tqi7GXpYNv-VSk_ay_snudAXFQ_Z7hz4YBPdkQw@mail.gmail.com>
Subject: Re: [PATCH v2 41/64] dmaengine: hsu: kill vchan BH on teardown
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:40=E2=80=AFPM Allen Pais <allen.lkml@gmail.com> =
wrote:
>
> Use dma_chan_kill_bh() for virt-dma cleanup.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

P.S. No need to Bcc, Cc is good enough and allows me to see the replies.

--=20
With Best Regards,
Andy Shevchenko
