package com.github.gzqyl.rnocr

import android.app.Application
import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.runBlocking

class RNUserDataStore: Application() {

    private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "mlkit_langcode_settings")

    override fun onCreate() {
        super.onCreate()
        appContext = applicationContext
    }

    companion object {

        lateinit  var appContext: Context

    }
    

    val langKey = stringPreferencesKey("mlkit_lang_code")

    fun getMLkitLang(): String {

        return runBlocking{

            appContext.dataStore.data.firstOrNull()?.get(langKey) ?: "en"

        }

    }

    fun setMLkitLang(langCode: String) {

        runBlocking{

            appContext.dataStore.edit { preferences ->
                preferences[langKey] = langCode
            }

        }

    }
    
    fun isLangSetted(): Boolean {

        return runBlocking{

            val langCode = appContext.dataStore.data.firstOrNull()?.get(langKey)

            langCode != null

        }

    }

}